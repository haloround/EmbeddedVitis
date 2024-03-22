/*
 * @Author: likaixiang
 * @Date: 2024-03-14 14:51:46
 * @LastEditTime: 2024-03-19 16:37:29
 * @Description: 通过GPIO控制器对PS端两个LED灯进行亮灭控制
 * @FilePath: \vitis\gpio_mio\src\main.c
 */

#include "xparameters.h"    //器件参数信息
#include "xstatus.h"        //包含XST_FAILURE和XST_SUCCESS的宏定义
#include "xil_printf.h"     //包含print()函数
#include "xgpiops.h"        //包含PS GPIO函数
#include "sleep.h"          //包含sleep()函数

/************************** Constant Definitions *****************************/
#define GPIO_DEVICE_ID   XPAR_XGPIOPS_0_DEVICE_ID
#define MIOLED0  7  
#define MIOLED1  8



XGpioPs Gpio;               //PS端GPIO驱动实例
XGpioPs_Config *ConfigPtr;  //PS端GPIO配置信息

int main()
{
    int Status;
    
    print("MIO Test!\n\r");

    //根据器件ID查找配置信息
    ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
    //初始化器件驱动，并用status进行状态记录
    Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr -> BaseAddr);

    if(Status != XST_SUCCESS){
        return XST_FAILURE;
    }

    //设置指定引脚的方向：0输入，1输出
    XGpioPs_SetDirectionPin(&Gpio, MIOLED0, 1);
    XGpioPs_SetDirectionPin(&Gpio, MIOLED1, 1);
    //使能指定引脚输出，0禁止输出使能，1使能输出
    XGpioPs_SetOutputEnablePin(&Gpio, MIOLED0, 1);
    XGpioPs_SetOutputEnablePin(&Gpio, MIOLED1, 1);

    while (1)
    {
        XGpioPs_WritePin(&Gpio, MIOLED0, 0x0);
        XGpioPs_WritePin(&Gpio, MIOLED1, 0x1);
        sleep(1);
        XGpioPs_WritePin(&Gpio, MIOLED0, 0x1);
        XGpioPs_WritePin(&Gpio, MIOLED1, 0x0);
        sleep(1);
        XGpioPs_WritePin(&Gpio, MIOLED0, 0x0);
        XGpioPs_WritePin(&Gpio, MIOLED1, 0x0);
        sleep(1);
        XGpioPs_WritePin(&Gpio, MIOLED0, 0x1);
        XGpioPs_WritePin(&Gpio, MIOLED1, 0x1);
        sleep(1);
    }
    return XST_SUCCESS;
}
