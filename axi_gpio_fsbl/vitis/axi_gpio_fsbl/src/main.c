/*
 * @Author: your name
 * @Date: 2024-03-18 11:20:41
 * @LastEditors: lkx 1620558464@qq.com
 * @LastEditTime: 2024-03-22 14:40:39
 * @Description:
 * @FilePath: \vitis\axi_gpio\src\main.c
 */

/**
 * 设计思路：
 * PL按键连接到了AXI GPIO IP核，而PS端的LED链接到了GPIO
 * 因此程序中需要对AXI GPIO核和GPIO核进行初始化。
 * 还需要对中断控制器进行初始化和关联中断函数，当检测到按键变化时，切换LED状态
*/


#include "xparameters.h"
#include "xgpiops.h"
#include "xgpio.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xplatform_info.h"
#include <xil_printf.h>
#include "sleep.h"

/************************** Constant Definitions *****************************/
//以下常量映射到xparameters.h文件
#define GPIOPS_DEVICE_ID XPAR_XGPIOPS_0_DEVICE_ID
#define AXI_GPIO_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define SCUGIC_ID XPAR_SCUGIC_0_DEVICE_ID
#define AXI_GPIO_INT_ID XPAR_FABRIC_GPIO_0_VEC_ID

#define MIO_LED 0
#define KEY_CHANNEL1 1
#define KEY_CH1_MASK XGPIO_IR_CH1_MASK

/************************** Function Prototypes ******************************/

//初始化各器件驱动
void instance_init();
//建立中断系统
int setup_interrupt_system(XScuGic *gic_inst_ptr, XGpio *axi_gpio_inst_ptr, u16 AXI_GpioIntrId);
//中断处理函数
static void intr_handler(void *callback_ref);

/**************************Global Variable Definitions ***********************/
XGpioPs gpiops_inst;
XGpio axi_gpio_inst;
XScuGic scugic_inst;
int led_value = 1;

/************************** Function Definitions *****************************/
int main(void)
{
    int status;

    //初始化各个器件驱动；
    instance_init();

    xil_printf("AXI_GPIO interrupt Test\r\n");

    //设置GPIO PS端引脚方向，输出使能，写入led_value
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED, 1);
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED, 1);
    XGpioPs_WritePin(&gpiops_inst, MIO_LED, led_value);

    //建立中断，出现错误则打印信息并退出
    status = setup_interrupt_system(&scugic_inst, &axi_gpio_inst, AXI_GPIO_INT_ID);
    if(status != XST_SUCCESS) {
        xil_printf("Setup interrupt system failed\r\n");
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

/**
 * @description:
 * @return {*}
 */
void instance_init()
{
    XScuGic_Config *scugic_cfg_ptr;
    XGpioPs_Config *gpiops_cfg_ptr;

    //初始化中断控制器驱动
    scugic_cfg_ptr = XScuGic_LookupConfig(SCUGIC_ID);
    XScuGic_CfgInitialize(&scugic_inst, scugic_cfg_ptr, scugic_cfg_ptr -> CpuBaseAddress);

    //初始化PS端 GPIO驱动
    gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_DEVICE_ID);
    XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr -> BaseAddr);

    //初始化PL端 AXI GPIO驱动
    XGpio_Initialize(&axi_gpio_inst, AXI_GPIO_DEVICE_ID);
}

/**
 * @description: 建立中断系统，使能KEY按键中断
 * @param {XScuGic} *gic_inst_ptr是一个指向xscugic驱动实例的指针
 * @param {XGpio} *axi_gpio_inst_ptr是一个指向连接到中断的gpio组件实例的指针
 * @param {u16} AXI_GpioIntrId是gpio中断的id
 * @return {*}
 */
int setup_interrupt_system(XScuGic *gic_inst_ptr, XGpio *axi_gpio_inst_ptr, u16 AXI_GpioIntrId)
{
    //设置并使能中断异常
    //它会将中断控制器 GIC 的中断处理程序与 ARM 处理器中的硬件中断处理逻辑连接起来。另外还要通过 Xil_ExceptionEnable()函数使能 IRQ 异常
    Xil_ExceptionInit();
    //XIL_EXCEPTION_ID_INT用于标记中断请求(IRQ)异常
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, gic_inst_ptr);
    Xil_ExceptionEnable();

    //设置中断源的优先级和请求类型（优先级为0xA0，高电平请求）
    XScuGic_SetPriorityTriggerType(gic_inst_ptr, AXI_GpioIntrId, 0xA0, 0x01);

    //XScuGic_Connect()方法来关联中断ID和中断处理函数
    XScuGic_Connect(gic_inst_ptr, AXI_GpioIntrId, (Xil_ExceptionHandler) intr_handler, (void *) axi_gpio_inst_ptr);

    //使能来自于axi_gpio器件的中断
    XScuGic_Enable(gic_inst_ptr, AXI_GpioIntrId);

    //设置AXI GPIO通道1方向为输入
    XGpio_SetDataDirection(axi_gpio_inst_ptr, KEY_CHANNEL1, 1);
    XGpio_InterruptEnable(axi_gpio_inst_ptr, KEY_CH1_MASK);
    XGpio_InterruptGlobalEnable(axi_gpio_inst_ptr);             //使能全局中断

    return XST_SUCCESS;
}

/**
 * @description: 中断处理函数，实现按键中断控制LED灯亮灭
 * @param {void} *callback_ref是指向上层回调引用的指针
 * @return {*}
 */
static void intr_handler(void *callback_ref)
{
    XGpio *axi_gpio_inst_ptr = (XGpio *)callback_ref;
    usleep(20000);
    //电平敏感类型的中断，在中断服务函数响应了中断之后，需要将中断源的中断清除
    if(XGpio_DiscreteRead(axi_gpio_inst_ptr, KEY_CHANNEL1) == 0) {
        print("Interrupt Detected!\r\n");
        //翻转，赋值
        led_value = ~led_value;
        XGpioPs_WritePin(&gpiops_inst, MIO_LED, led_value);
        XGpio_InterruptDisable(axi_gpio_inst_ptr, KEY_CH1_MASK);
    }
    XGpio_InterruptClear(axi_gpio_inst_ptr, KEY_CH1_MASK);
    XGpio_InterruptEnable(axi_gpio_inst_ptr, KEY_CH1_MASK);
}
