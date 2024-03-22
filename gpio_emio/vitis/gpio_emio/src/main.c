/*
 * @Author: likaixiang
 * @Date: 2024-03-15 16:33:48
 * @LastEditTime: 2024-03-19 16:48:10
 * @Description: 
 * @FilePath: \vitis\gpio_emio\src\main.c
 */

#include "stdio.h"
#include "xparameters.h"
#include "xgpiops.h"

#define GPIOPS_ID XPAR_XGPIOPS_0_DEVICE_ID

#define MIO_LED0 7
#define MIO_LED1 8
#define MIO_KEY0 12
#define EMIO_KEY 54

int main(){
    
    printf("EMIO TEST!\n");
    
    //PS端GPIO驱动实例
    XGpioPs gpiops_inst;
    //PS端GPIO配置信息
    XGpioPs_Config *gpiops_cfg_ptr;

    //根据器件ID查找配置信息
    gpiops_cfg_ptr = XGpioPs_LookupConfig(GPIOPS_ID);

    //初始化器件驱动
    XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr -> BaseAddr);

    //设置LED引脚为输出
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED0, 1);
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_LED1, 1);

    //设置LED引脚使能
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED0, 1);
    XGpioPs_SetOutputEnablePin(&gpiops_inst, MIO_LED1, 1);

    //设置KEY引脚为输入
    XGpioPs_SetDirectionPin(&gpiops_inst, MIO_KEY0, 0);
    XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_KEY, 0);


    //读取按键状态，用于控制LED亮灭
    while(1){
        XGpioPs_WritePin(&gpiops_inst, MIO_LED0, ~XGpioPs_ReadPin(&gpiops_inst, MIO_KEY0));

        XGpioPs_WritePin(&gpiops_inst, MIO_LED1, ~XGpioPs_ReadPin(&gpiops_inst, EMIO_KEY));

    }

    return 0;
}





