//
///***************************** Include Files ********************************/
//
//#include "xparameters.h"
//#include "xgpiops.h"
//#include "xstatus.h"
//#include "xplatform_info.h"
//#include <xil_printf.h>
//
///************************** Constant Definitions ****************************/
//
//#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID
//
//#define printf			xil_printf	/* Smalller foot-print printf */
//
//#define LED0 54
//#define LED1 55
//#define SW1  56
//static int GpioOutputExample(void);
//static int GpioInputExample(u32 *DataRead);
//int GpioPolledExample(u16 DeviceId, u32 *DataRead);
//
//static XGpioPs GpioPs;
//static XGpioPs_Config * GpioCnfPtr;
//int main(void)
//{
//	initGpio();
//	while(1){
//		if(XGpioPs_ReadPin(&GpioPs, SW1) == 0){
//			XGpioPs_WritePin(&GpioPs, LED0, 0x1);
//			XGpioPs_WritePin(&GpioPs, LED1, 0x1);
//		} else {
//			XGpioPs_WritePin(&GpioPs, LED1, 0);
//			XGpioPs_WritePin(&GpioPs, LED0, 0);
//		}
//	}
//	return 0;
//}
//
//
//
//int initGpio(){
//	int status;
//	GpioCnfPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
//	status = XGpioPs_CfgInitialize(&GpioPs,GpioCnfPtr,GpioCnfPtr->BaseAddr);
//	if(status != XST_SUCCESS){
//		return	status;
//	}
//	XGpioPs_SetDirectionPin(&GpioPs,LED0,0x01);
//	XGpioPs_SetDirectionPin(&GpioPs,LED1,0x01);
//	XGpioPs_SetOutputEnablePin(&GpioPs,LED0,0x01);
//	XGpioPs_SetOutputEnablePin(&GpioPs,LED1,0x01);
//	XGpioPs_SetDirectionPin(&GpioPs,SW1,0x00);//input for button
//	XGpioPs_SetOutputEnablePin(&GpioPs,LED1,0x00);
//}
