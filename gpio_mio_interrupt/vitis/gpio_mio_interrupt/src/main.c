/*
 * @Author: likaixiang
 * @Date: 2024-03-17 22:42:44
 * @LastEditTime: 2024-03-19 16:49:21
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

XGpioPs gpio;
XScuGic intc;
u32 key_press;
u32 key_val;

int main(void)
{
    int status;
    XGpioPs_Config *ConfigPtr;

    xil_printf("Gpio interrupt test!\n");

    ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
    if(ConfigPtr == NULL){
        return XST_FAILURE;
    }

    XGpioPs_CfgInitialize(&gpio, ConfigPtr, ConfigPtr -> BaseAddr);

    XGpioPs_SetDirectionPin(&gpio, KEY, 0);

    XGpioPs_SetDirectionPin(&gpio, LED, 1);
    XGpioPs_SetOutputEnablePin(&gpio, LED, 1);
    XGpioPs_WritePin(&gpio, LED, 0x0);

    status = setup_interrupt_system(&intc, &gpio, GPIO_INTERRUPT_ID);
    if(status != XST_SUCCESS){
        xil_printf("Setup interrupt system failed!\n");
        return XST_FAILURE;
    }

    while (1)
    {
        if(key_press){
            usleep(20000);
            if(XGpioPs_ReadPin(&gpio, KEY) == 0){
                key_val = ~key_val;
                XGpioPs_WritePin(&gpio, LED, key_val);
            }
            key_press = FALSE;
            XGpioPs_IntrClearPin(&gpio,  KEY);
            XGpioPs_IntrEnablePin(&gpio, KEY);
        }
    }
    return XST_SUCCESS;
}


static void intr_handler(void *callback_ref)
{
    XGpioPs *gpio = (XGpioPs *)callback_ref;


    if(XGpioPs_IntrGetStatusPin(gpio, KEY)) {
        key_press = TRUE;
        XGpioPs_IntrDisablePin(gpio, KEY);
    }
}

int setup_interrupt_system(XScuGic *gic_ins_ptr, XGpioPs *gpio, u16 GpioIntrId)
{
    int status;
    XScuGic_Config *IntcConfig;

    IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
    if(NULL == IntcConfig){
        return XST_FAILURE;
    }

    status = XScuGic_CfgInitialize(gic_ins_ptr, IntcConfig, IntcConfig -> CpuBaseAddress);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, gic_ins_ptr);
    Xil_ExceptionEnable();

    status = XScuGic_Connect(gic_ins_ptr, GpioIntrId, (Xil_ExceptionHandler) intr_handler, (void *)gpio);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XScuGic_Enable(gic_ins_ptr, GpioIntrId);

    XGpioPs_SetIntrTypePin(gpio, KEY, XGPIOPS_IRQ_TYPE_EDGE_FALLING);

    XGpioPs_IntrEnablePin(gpio, KEY);

    return XST_SUCCESS;
}
