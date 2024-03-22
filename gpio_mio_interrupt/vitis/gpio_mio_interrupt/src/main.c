/*
 * @Author: likaixiang
 * @Date: 2024-03-17 22:42:44
 * @LastEditTime: 2024-03-22 11:00:16
 * @Description: 
 * @FilePath: \vitis\gpio_mio_interrupt\src\main.c
 */

#include "xparameters.h"
#include "xgpiops.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xplatform_info.h"
#include <xil_printf.h>
#include "sleep.h"

#define GPIO_DEVICE_ID XPAR_XGPIOPS_0_DEVICE_ID
#define INTC_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID
#define GPIO_INTERRUPT_ID XPAR_XGPIOPS_0_INTR


#define KEY 11
#define LED 0

static void intr_handler(void *callback_ref);
int setup_interrupt_system(XScuGic *gic_ins_ptr, XGpioPs *gpio, u16 GpioIntrId);

//PS端GPIO驱动实例
XGpioPs gpio;
//通用终端控制器驱动实例
XScuGic intc;
//KEY按键按下的标志
u32 key_press;
//用于控制LED的键值
u32 key_val;

int main(void)
{
    int status;
    
    //PS端GPIO配置信息
    XGpioPs_Config *ConfigPtr;

    xil_printf("Gpio interrupt test!\n");

    //根据器件ID查找配置信息
    ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
    if(ConfigPtr == NULL){
        return XST_FAILURE;
    }

    //初始化GPIO Driver
    XGpioPs_CfgInitialize(&gpio, ConfigPtr, ConfigPtr -> BaseAddr);

    //设置KEY所连接的MIO引脚的方向为输入
    XGpioPs_SetDirectionPin(&gpio, KEY, 0);
    //设置LED所连接的MIO引脚方向为输出，并使能输出
    XGpioPs_SetDirectionPin(&gpio, LED, 1);
    XGpioPs_SetOutputEnablePin(&gpio, LED, 1);
    //像LED引脚写入0
    XGpioPs_WritePin(&gpio, LED, 0x0);

    //建立终端，出现错误则打印信息并退出
    status = setup_interrupt_system(&intc, &gpio, GPIO_INTERRUPT_ID);
    if(status != XST_SUCCESS){
        xil_printf("Setup interrupt system failed!\n");
        return XST_FAILURE;
    }

    while (1)
    {
        //当中断处理函数，将key_press赋值为TRUE时，执行操作，反转key_val，写入引脚，实现按键中断控制LED灯亮灭
        if(key_press){
            usleep(20000);
            if(XGpioPs_ReadPin(&gpio, KEY) == 0){
                key_val = ~key_val;
                XGpioPs_WritePin(&gpio, LED, key_val);
            }
            key_press = FALSE;
            XGpioPs_IntrClearPin(&gpio,  KEY);
            //中断使能
            XGpioPs_IntrEnablePin(&gpio, KEY);
        }
    }
    return XST_SUCCESS;
}

//中断处理函数
//callback_ref为上层函数调用返回
static void intr_handler(void *callback_ref)
{
    XGpioPs *gpio = (XGpioPs *)callback_ref;
    
    if(XGpioPs_IntrGetStatusPin(gpio, KEY)) {
        key_press = TRUE;
        XGpioPs_IntrDisablePin(gpio, KEY);
    }
}
//建立中断系统函数
//设置并启动GPIO中断
int setup_interrupt_system(XScuGic *gic_ins_ptr, XGpioPs *gpio, u16 GpioIntrId)
{
    int status;
    XScuGic_Config *IntcConfig;

    //初始化中断控制器
    IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
    if(NULL == IntcConfig){
        return XST_FAILURE;
    }
    status = XScuGic_CfgInitialize(gic_ins_ptr, IntcConfig, IntcConfig -> CpuBaseAddress);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    //异常处理函数
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, gic_ins_ptr);
    Xil_ExceptionEnable();

    //XScuGic_Connect()函数来将GPIO中断连接到中断控制器
    //为中断设置终端处理函数intr_handler()
    status = XScuGic_Connect(gic_ins_ptr, GpioIntrId, (Xil_ExceptionHandler) intr_handler, (void *)gpio);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    //使能中断控制器中的特定GPIO中断
    XScuGic_Enable(gic_ins_ptr, GpioIntrId);

    //配置GPIO引脚的触发方式，XGPIOPS_IRQ_TYPE_EDGE_FALLING即设置为下降沿触发
    XGpioPs_SetIntrTypePin(gpio, KEY, XGPIOPS_IRQ_TYPE_EDGE_FALLING);

    //使能GPIO引脚的中断功能
    XGpioPs_IntrEnablePin(gpio, KEY);

    return XST_SUCCESS;
}