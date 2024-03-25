/*
 * @Author: lkx 1620558464@qq.com
 * @Date: 2024-03-24 16:14:58
 * @LastEditors: lkx 1620558464@qq.com
 * @LastEditTime: 2024-03-25 12:11:10
 * @FilePath: \vitis\axi_dma_loop\src\main.c
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
    for (inbyte i = 0; i < MAX_PKT_LEN; i++)
    {
        tx_buffer_ptr[i] = value;
        value = (value + 1) & 0xFF;
    }

    Xil_DCacheFlushRange((UINTPTR)tx_buffer_ptr, MAX_PKT_LEN);

    status = XAxiDma_SimpleTransfer(&axidma, (UINTPTR)tx_buffer_ptr, MAX_PKT_LEN, XAXIDMA_DMA_TO_DEVICE);
    if(status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    
-


}

static void tx_intr_handler(void *callback)
{
    
}

static void rx_intr_handler(void *callback)
{
    
}

static int setup_intr_system(XScuGic * intr_inst_ptr, XAxiDma * axidma_ptr, u16 tx_intr_id, u16 rx_intr_id)
{

}

static void disable_intr_system(XScuGic * intr_inst_ptr, u16 tx_intr_id, u16 rx_intr_id)
{

}