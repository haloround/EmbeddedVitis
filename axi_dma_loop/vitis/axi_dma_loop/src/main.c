/*
 * @Author: lkx 1620558464@qq.com
 * @Date: 2024-03-24 16:14:58
 * @LastEditors: lkx 1620558464@qq.com
 * @LastEditTime: 2024-03-25 15:21:18
 * @FilePath: \EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop\src\main.c
 * @Description: 
 */
#include "xparameters.h"
#include "xaxidma.h"
#include "xil_exception.h"
#include "xscugic.h"

/************************** Constant Definitions *****************************/

#define DMA_DEV_ID XPAR_AXIDMA_0_DEVICE_ID
#define RX_INTR_ID XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID
#define TX_INTR_ID XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID
#define INTC_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID
#define DDR_BASE_ADDR XPAR_PS7_DDRC_0_S_AXI_BASEADDR
#define MEM_BASE_ADDR (DDR_BASE_ADDR + 0x10000000)
#define TX_BUFFER_BASE (MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE (MEM_BASE_ADDR + 0x00300000)
#define RESET_TIMEOUT_COUNTER 10000
#define TEST_START_VALUE 0x0
#define MAX_PKT_LEN 0x100

/************************** Function Prototypes ******************************/

static int check_data(int length, u8 start_value);
static void tx_intr_handler(void *callback);
static void rx_intr_handler(void *callback);
static int setup_intr_system(XScuGic * intr_inst_ptr, XAxiDma * axidma_ptr, u16 tx_intr_id, u16 rx_intr_id);
static void disable_intr_system(XScuGic * intr_inst_ptr, u16 tx_intr_id, u16 rx_intr_id);

static XAxiDma axidma;
static XScuGic intc;
volatile int tx_done;
volatile int rx_done;
volatile int error;

/************************** Function Definitions *****************************/
int main(void)
{
    int i;
    int status;
    u8 value;
    u8 * tx_buffer_ptr;
    u8 * rx_buffer_ptr;
    XAxiDma_Config *axidma_config;

    tx_buffer_ptr = (u8*) TX_BUFFER_BASE;
    rx_buffer_ptr = (u8*) RX_BUFFER_BASE;

    xil_printf("\r\n----Entering main()----\r\n");


    axidma_config = XAxiDma_LookupConfig(DMA_DEV_ID);
    if(!axidma_config) {
        xil_printf("No config found for %d\r\n", DMA_DEV_ID);
        return XST_FAILURE;
    }

    //初始化DMA引擎
    status = XAxiDma_CfgInitialize(&axidma, axidma_config);
    if(status != XST_SUCCESS) {
        xil_printf("Initialization failed %d\r\n", status);
        return XST_FAILURE;
    }

    if(XAxiDma_HasSg(&axidma)) {
        xil_printf("Device configured as SG mode\r\n");
        return XST_FAILURE;
    }

    status = setup_intr_system(&intc, &axidma, TX_INTR_ID, RX_INTR_ID);
    if(status != XST_SUCCESS) {
        xil_printf("Failed intr setup\r\n");
        return XST_FAILURE;
    }

    //初始化标志信号
    tx_done = 0;
    rx_done = 0;
    error = 0;

    value = TEST_START_VALUE;
    for (int i = 0; i < MAX_PKT_LEN; i++)
    {
        tx_buffer_ptr[i] = value;
        value = (value + 1) & 0xFF;
    }

    //刷新Data Cache
    Xil_DCacheFlushRange((UINTPTR)tx_buffer_ptr, MAX_PKT_LEN);

    status = XAxiDma_SimpleTransfer(&axidma, (UINTPTR)tx_buffer_ptr, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    
    while (!tx_done && !error)
    {
        //等待AXI DMA搬运完从DDR3到AXI Stream Data FIFO的数据
    }
    
    if(error) {
        xil_printf("Failed test transmit%s done\r\n", tx_done ? " " : " not");
        goto Done;
    }

    status = XAxiDma_SimpleTransfer(&axidma, (UINTPTR) rx_buffer_ptr, MAX_PKT_LEN, XAXIDMA_DEVICE_TO_DMA);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    while (!rx_done && !error)
    {
        //等待AXI DMA搬运完AXI Stream Data FIFO到DDR3的数据
    }

    if(error) {
        xil_printf("Failed test revice%s\r\n", rx_done ? " " : " not");
        goto Done;
    }

    Xil_DCacheFlushRange((UINTPTR) rx_buffer_ptr, MAX_PKT_LEN);

    status = check_data(MAX_PKT_LEN, TEST_START_VALUE);
    if(status != XST_SUCCESS) {
        xil_printf("Data check failed\r\n");
        goto Done;
    }

    xil_printf("Successfully ran AXI DMA Loop\r\n");
    disable_intr_system(&intc, TX_INTR_ID, RX_INTR_ID);

    Done:xil_printf("----Exiting main()----\r\n");
    return XST_SUCCESS;
}

static int check_data(int length, u8 start_value)
{
    u8 value;
    u8 *rx_packet;

    int i = 0;

    value = start_value;
    rx_packet = (u8 *) RX_BUFFER_BASE;
    for(i = 0; i < length; i++) {
        if(rx_packet[i] != value) {
            xil_printf("Data error %d: %x%x\r\n", i, rx_packet[i], value);
            return XST_FAILURE;
        }
        value = (value + 1) & 0xFF;
    }
    
    return XST_SUCCESS;
}

static void tx_intr_handler(void *callback)
{
    int timeout;
    u32 irq_status;
    XAxiDma *axidma_inst = (XAxiDma *)callback;

    //读取待处理的中断
    irq_status = XAxiDma_IntrGetIrq(axidma_inst, XAXIDMA_DMA_TO_DEVICE);
    //确认待处理的中断
    XAxiDma_IntrAckIrq(axidma_inst, irq_status, XAXIDMA_DMA_TO_DEVICE);

    //tx出错
    if ((irq_status & XAXIDMA_IRQ_ERROR_MASK)) {
        error = 1;
        XAxiDma_Reset(axidma_inst);
        timeout = RESET_TIMEOUT_COUNTER;
        while (timeout)
        {
            if(XAxiDma_ResetIsDone(axidma_inst))
                break;
            timeout -= 1;
        }
        return ;
    }

    //TX完成
    if ((irq_status & XAXIDMA_IRQ_IOC_MASK))
        tx_done = 1;
}

static void rx_intr_handler(void *callback)
{
    int timeout;
    u32 irq_status;
    XAxiDma *axidma_inst = (XAxiDma *)callback;

    //读取待处理的中断
    irq_status = XAxiDma_IntrGetIrq(axidma_inst, XAXIDMA_DEVICE_TO_DMA);
    //确认待处理的中断
    XAxiDma_IntrAckIrq(axidma_inst, irq_status, XAXIDMA_DEVICE_TO_DMA);

    //rx出错
    if ((irq_status & XAXIDMA_IRQ_ERROR_MASK)) {
        error = 1;
        XAxiDma_Reset(axidma_inst);
        timeout = RESET_TIMEOUT_COUNTER;
        while (timeout)
        {
            if(XAxiDma_ResetIsDone(axidma_inst))
                break;
            timeout -= 1;
        }
        return ;
    }

    //rx完成
    if ((irq_status & XAXIDMA_IRQ_IOC_MASK))
        rx_done = 1;
}
/**
 * @description: 建立中断系统
 * @param {XScuGic *} intr_inst_ptr是指向Xscugic实例的指针
 * @param {XAxiDma *} axidma_ptr是指向DMA引擎实例的指针
 * @param {u16} tx_intr_id是TX通道中断ID
 * @param {u16} rx_intr_id是RX通道中断ID
 * @return {*}
 */
static int setup_intr_system(XScuGic * intr_inst_ptr, XAxiDma * axidma_ptr, u16 tx_intr_id, u16 rx_intr_id)
{
    int status;
    XScuGic_Config *intc_config;
    
    intc_config = XScuGic_LookupConfig(INTC_DEVICE_ID);
    if(NULL == intc_config) {
        return XST_FAILURE;
    }

    status = XScuGic_CfgInitialize(intr_inst_ptr, intc_config, intc_config -> CpuBaseAddress);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    //设置优先级和触发类型
    XScuGic_SetPriorityTriggerType(intr_inst_ptr, tx_intr_id, 0xA0, 0x3);
    XScuGic_SetPriorityTriggerType(intr_inst_ptr, rx_intr_id, 0xA0, 0x3);


    status = XScuGic_Connect(intr_inst_ptr, tx_intr_id, (Xil_InterruptHandler) tx_intr_handler, axidma_ptr);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    status = XScuGic_Connect(intr_inst_ptr, rx_intr_id, (Xil_InterruptHandler) rx_intr_handler, axidma_ptr);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    XScuGic_Enable(intr_inst_ptr, tx_intr_id);
    XScuGic_Enable(intr_inst_ptr, rx_intr_id);

    //启用来自硬件的中断，这三个函数是一起的
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, (void *) intr_inst_ptr);
    Xil_ExceptionEnable();

    //使能DMA中断
    XAxiDma_IntrEnable(&axidma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_IntrEnable(&axidma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

    return XST_SUCCESS;
}

//此函数来禁用DMA引擎中断
static void disable_intr_system(XScuGic * intr_inst_ptr, u16 tx_intr_id, u16 rx_intr_id)
{
    XScuGic_Disconnect(intr_inst_ptr, tx_intr_id);
    XScuGic_Disconnect(intr_inst_ptr, rx_intr_id);
}