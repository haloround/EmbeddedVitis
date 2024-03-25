//****************************************Copyright (c)***********************************//
//----------------------------------------------------------------------------------------
// File name:           main.c
// Last modified Date:  2023/3/24 11:25:36
// Last Version:        V1.0
// Descriptions:        �Զ���IP��-������
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2023/3/24 11:25:36
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

#include "stdio.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "breath_led_ip.h"
#include "xil_io.h"
#include "sleep.h"

#define  LED_IP_BASEADDR   XPAR_BREATH_LED_IP_0_S0_AXI_BASEADDR  //LED IP����ַ
#define  LED_IP_REG0       BREATH_LED_IP_S0_AXI_SLV_REG0_OFFSET  //LED IP�Ĵ�����ַ0
#define  LED_IP_REG1       BREATH_LED_IP_S0_AXI_SLV_REG1_OFFSET  //LED IP�Ĵ�����ַ1

//main����
int main()
{
 int freq_flag;      //����Ƶ��״̬������ѭ���ı�����Ƶĺ���Ƶ��
 int led_state;      //����LED�Ƶ�״̬

 xil_printf("LED User IP Test!\r\n");
 while(1){
     //����freq_flag�ı�־λ,�л������Ƶ�Ƶ��
     if(freq_flag == 0){
    	 BREATH_LED_IP_mWriteReg(LED_IP_BASEADDR,LED_IP_REG1,0x80000001);
         freq_flag = 1;
     }
     else{
    	 BREATH_LED_IP_mWriteReg(LED_IP_BASEADDR,LED_IP_REG1,0x80000004);
         freq_flag = 0;
     }
     //��ȡLED��ǰ����״̬   1:��  0:�ر�
     led_state = BREATH_LED_IP_mReadReg(LED_IP_BASEADDR,LED_IP_REG0);
     //������عر�,�򿪺�����
     if(led_state == 0){
    	 BREATH_LED_IP_mWriteReg (LED_IP_BASEADDR, LED_IP_REG0, 1);
         xil_printf("Breath LED ON\r\n");
     }
     sleep(8);
     //��ȡLED��ǰ����״̬   1:��  0:�ر�
     led_state = BREATH_LED_IP_mReadReg(LED_IP_BASEADDR,LED_IP_REG0);
     //������ش�,�رպ�����
     if(led_state == 1){
    	 BREATH_LED_IP_mWriteReg (LED_IP_BASEADDR, LED_IP_REG0, 0);
         xil_printf("Breath LED OFF\r\n");
     }
     sleep(1);
 }
}
