/*
 * @Author: lkx 1620558464@qq.com
 * @Date: 2024-03-24 16:14:58
 * @LastEditors: likaixiang 1620558464@qq.com
 * @LastEditTime: 2024-03-26 14:37:32
 * @FilePath: \EmbeddedVitis\axi_dma_loop\vitis\axi_dma_loop\src\main.c
 * @Description: 
 */

/*
DMA,硬件实现存储器与存储器之间或者存储器与I/O外设间直接进行高速数据传输的内存技术。
它允许不同速度的硬件设备进行沟通，而不用使用中央处理器的中断负载。
*/

/*实验具体流程为：
PS端产生测试数据写入到DDR3中，然后PL端AXI DMA IP核从DDR3中读取数据，将读取到的数据存储到AXI Stream Data FIFO中，
然后再将AXI Stream Data FIFO中的数据写回到DDR3中。并判断DDR3读取的数据和写入的数据是否一致。
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

    //查找AXI DMA IP核的配置信息
    axidma_config = XAxiDma_LookupConfig(DMA_DEV_ID);
    if(!axidma_config) {
        xil_printf("No config found for %d\r\n", DMA_DEV_ID);
        return XST_FAILURE;
    }

    //初始化AXI DMA IP核引擎
    status = XAxiDma_CfgInitialize(&axidma, axidma_config);
    if(status != XST_SUCCESS) {
        xil_printf("Initialization failed %d\r\n", status);
        return XST_FAILURE;
    }
    //本次实验中AXI DMA IP不需要设置为SG模式
    if(XAxiDma_HasSg(&axidma)) {
        xil_printf("Device configured as SG mode\r\n");
        return XST_FAILURE;
    }

    //设置中断系统，并连接AXI DMA的中断处理函数
    status = setup_intr_system(&intc, &axidma, TX_INTR_ID, RX_INTR_ID);
    if(status != XST_SUCCESS) {
        xil_printf("Failed intr setup\r\n");
        return XST_FAILURE;
    }

    //初始化标志信号
    tx_done = 0;//发送操作完成时，设置为1
    rx_done = 0;//接收操作完成时，设置为1
    error = 0;//标志是否发生错误

    //将256个数据写入发送缓冲区tx_buffer_ptr
    value = TEST_START_VALUE;
    for (int i = 0; i < MAX_PKT_LEN; i++)
    {
        tx_buffer_ptr[i] = value;
        value = (value + 1) & 0xFF;
    }

    //刷新Data Cache，刷新数据缓存以确保写入缓冲区的数据被及时更新到 DDR3 内存中
    Xil_DCacheFlushRange((UINTPTR)tx_buffer_ptr, MAX_PKT_LEN);

    //启动 AXI DMA 的简单传输操作，将写入缓冲区的数据从 DDR3 内存传输到 AXI Stream 接口（即传输到外部设备）
    status = XAxiDma_SimpleTransfer(&axidma, (UINTPTR) tx_buffer_ptr, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
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

    //刷新DDR3中rx_buffer_ptr起始的MAX_PKT_LEN个字节，确保从FIFO中收到的数据写入到DDR3
    Xil_DCacheFlushRange((UINTPTR) rx_buffer_ptr, MAX_PKT_LEN);

    status = check_data(MAX_PKT_LEN, TEST_START_VALUE);
    if(status != XST_SUCCESS) {
        xil_printf("Data check failed\r\n");
        goto Done;
    }

    xil_printf("Successfully ran AXI DMA Loop\r\n");
    //禁用AXI DMA IP中断
    disable_intr_system(&intc, TX_INTR_ID, RX_INTR_ID);

    Done:xil_printf("----Exiting main()----\r\n");
    return XST_SUCCESS;
}

/**
 * @description: 比较向DDR3中写入的数据与经过DMA循环之后的数据是否一致
 * @param {int} length 传输数据长度
 * @param {u8} start_value 数据初始值，0x0
 * @return {*}
 */
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

    //TX完成，tx_done设置为1，跳出main函数中的while循环，进行下一步操作
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

    //rx完成，将rx_done设置为1，跳出main函数中的while循环执行下一步
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

    //获取中断控制器配置信息
    intc_config = XScuGic_LookupConfig(INTC_DEVICE_ID);
    if(NULL == intc_config) {
        return XST_FAILURE;
    }

    //初始化中断控制器
    status = XScuGic_CfgInitialize(intr_inst_ptr, intc_config, intc_config -> CpuBaseAddress);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    //设置优先级和触发类型
    XScuGic_SetPriorityTriggerType(intr_inst_ptr, tx_intr_id, 0xA0, 0x3);
    XScuGic_SetPriorityTriggerType(intr_inst_ptr, rx_intr_id, 0xA0, 0x3);

    //将中断处理函数与传输完成的中断 ID 相关联起来
    //中断处理函数与指定的中断 ID 相关联起来的作用是建立了中断处理函数与特定中断事件之间的映射关系。
    //这个映射关系的建立使得当特定的中断事件发生时，系统能够自动调用相应的中断处理函数来进行处理。
    status = XScuGic_Connect(intr_inst_ptr, tx_intr_id, (Xil_InterruptHandler) tx_intr_handler, axidma_ptr);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    //将中断处理函数与接收完成的中断 ID 相关联起来
    status = XScuGic_Connect(intr_inst_ptr, rx_intr_id, (Xil_InterruptHandler) rx_intr_handler, axidma_ptr);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    //在将中断处理函数与相应中断ID绑定之后，还需要启用中断控制器、使能中断源、使能中断处理器

    //使能中断源
    XScuGic_Enable(intr_inst_ptr, tx_intr_id);
    XScuGic_Enable(intr_inst_ptr, rx_intr_id);

    //启用来自硬件的中断，这三个函数是一起的，使能中断处理器
    Xil_ExceptionInit();
    Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, (void *) intr_inst_ptr);
    Xil_ExceptionEnable();

    //使能DMA中断，使得DMA通道在发送完和接收完数据之后，产生相应中断信号
    //XAXIDMA_IRQ_ALL_MASK参数，表示使能所有可能的中断类型
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