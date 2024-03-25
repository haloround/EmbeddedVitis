/*
 * @Author: your name
 * @Date: 2024-03-18 11:20:41
 * @LastEditors: lkx 1620558464@qq.com
 * @LastEditTime: 2024-03-22 14:40:39
 * @Description:
 * @FilePath: \vitis\axi_gpio\src\main.c
 */

/**
 * ���˼·��
 * PL�������ӵ���AXI GPIO IP�ˣ���PS�˵�LED���ӵ���GPIO
 * ��˳�������Ҫ��AXI GPIO�˺�GPIO�˽��г�ʼ����
 * ����Ҫ���жϿ��������г�ʼ���͹����жϺ���������⵽�����仯ʱ���л�LED״̬
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
//���³���ӳ�䵽xparameters.h�ļ�
#define GPIOPS_DEVICE_ID XPAR_XGPIOPS_0_DEVICE_ID
#define AXI_GPIO_DEVICE_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define SCUGIC_ID XPAR_SCUGIC_0_DEVICE_ID
#define AXI_GPIO_INT_ID XPAR_FABRIC_GPIO_0_VEC_ID

#define MIO_LED 0
#define KEY_CHANNEL1 1
#define KEY_CH1_MASK XGPIO_IR_CH1_MASK

/************************** Function Prototypes ******************************/

//��ʼ������������
void instance_init();
//�����ж�ϵͳ
int setup_interrupt_system(XScuGic *gic_inst_ptr, XGpio *axi_gpio_inst_ptr, u16 AXI_GpioIntrId);
//�жϴ�������
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

    //��ʼ����������������
    instance_init();

    xil_printf("AXI_GPIO interrupt Test\r\n");

    //����GPIO PS�����ŷ������ʹ�ܣ�д��led_value
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED, 1);
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED, 1);
    XGpioPs_WritePin(&gpiops_inst, MIO_LED, led_value);

    //�����жϣ����ִ������ӡ��Ϣ���˳�
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

    //��ʼ���жϿ���������
    scugic_cfg_ptr = XScuGic_LookupConfig(SCUGIC_ID);
    XScuGic_CfgInitialize(&scugic_inst, scugic_cfg_ptr, scugic_cfg_ptr -> CpuBaseAddress);

    //��ʼ��PS�� GPIO����
    gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_DEVICE_ID);
    XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr -> BaseAddr);

    //��ʼ��PL�� AXI GPIO����
    XGpio_Initialize(&axi_gpio_inst, AXI_GPIO_DEVICE_ID);
}

/**
 * @description: �����ж�ϵͳ��ʹ��KEY�����ж�
 * @param {XScuGic} *gic_inst_ptr��һ��ָ��xscugic����ʵ����ָ��
 * @param {XGpio} *axi_gpio_inst_ptr��һ��ָ�����ӵ��жϵ�gpio���ʵ����ָ��
 * @param {u16} AXI_GpioIntrId��gpio�жϵ�id
 * @return {*}
 */
int setup_interrupt_system(XScuGic *gic_inst_ptr, XGpio *axi_gpio_inst_ptr, u16 AXI_GpioIntrId)
{
    //���ò�ʹ���ж��쳣
    //���Ὣ�жϿ����� GIC ���жϴ��������� ARM �������е�Ӳ���жϴ����߼��������������⻹Ҫͨ�� Xil_ExceptionEnable()����ʹ�� IRQ �쳣
    Xil_ExceptionInit();
    //XIL_EXCEPTION_ID_INT���ڱ���ж�����(IRQ)�쳣
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, gic_inst_ptr);
    Xil_ExceptionEnable();

    //�����ж�Դ�����ȼ����������ͣ����ȼ�Ϊ0xA0���ߵ�ƽ����
    XScuGic_SetPriorityTriggerType(gic_inst_ptr, AXI_GpioIntrId, 0xA0, 0x01);

    //XScuGic_Connect()�����������ж�ID���жϴ�������
    XScuGic_Connect(gic_inst_ptr, AXI_GpioIntrId, (Xil_ExceptionHandler) intr_handler, (void *) axi_gpio_inst_ptr);

    //ʹ��������axi_gpio�������ж�
    XScuGic_Enable(gic_inst_ptr, AXI_GpioIntrId);

    //����AXI GPIOͨ��1����Ϊ����
    XGpio_SetDataDirection(axi_gpio_inst_ptr, KEY_CHANNEL1, 1);
    XGpio_InterruptEnable(axi_gpio_inst_ptr, KEY_CH1_MASK);
    XGpio_InterruptGlobalEnable(axi_gpio_inst_ptr);             //ʹ��ȫ���ж�

    return XST_SUCCESS;
}

/**
 * @description: �жϴ���������ʵ�ְ����жϿ���LED������
 * @param {void} *callback_ref��ָ���ϲ�ص����õ�ָ��
 * @return {*}
 */
static void intr_handler(void *callback_ref)
{
    XGpio *axi_gpio_inst_ptr = (XGpio *)callback_ref;
    usleep(20000);
    //��ƽ�������͵��жϣ����жϷ�������Ӧ���ж�֮����Ҫ���ж�Դ���ж����
    if(XGpio_DiscreteRead(axi_gpio_inst_ptr, KEY_CHANNEL1) == 0) {
        print("Interrupt Detected!\r\n");
        //��ת����ֵ
        led_value = ~led_value;
        XGpioPs_WritePin(&gpiops_inst, MIO_LED, led_value);
        XGpio_InterruptDisable(axi_gpio_inst_ptr, KEY_CH1_MASK);
    }
    XGpio_InterruptClear(axi_gpio_inst_ptr, KEY_CH1_MASK);
    XGpio_InterruptEnable(axi_gpio_inst_ptr, KEY_CH1_MASK);
}