#include "imx222.h"
// inital cmos
#define REG_NUM 29
#define REG_BYTE 3
u8 spi_wreg[REG_NUM][REG_BYTE]={
		{ 0x02, 0x00, 0x31 }, //standby
		{ 0x02, 0x01,0x01},	 // vs reverse
		{ 0X02, 0x02, 0xF }, //1080p
		{ 0X02, 0x03, 0x4c }, //2
		{ 0X02, 0x04, 0x04 }, //3
		{ 0X02, 0x05, 0x65 }, //4
		{ 0X02, 0x06, 0x04 }, //5
		{ 0X02, 0x11, 0x00 },//6
		{ 0X02, 0x12, 0x82 }, //7
		{ 0X02, 0x14, 0x00 }, //8
		{ 0X02, 0x15, 0x00 }, //9
		{ 0X02, 0x16, 0x3C }, //10
		{ 0X02, 0x17, 0x00 }, //11
		{ 0X02, 0x18, 0xC0 }, //12
		{ 0X02, 0x19, 0x07 }, //13
		{ 0X02, 0x1A, 0x51 }, //14
		{ 0X02, 0x1B, 0x04 }, //15
		{ 0X02, 0x1e, 0x20 }, //gain
		{ 0X02, 0x20, 0xf0 }, //16
		{ 0X02, 0x21, 0x00 }, //16
		{ 0X02, 0x2c, 0x00 }, //16
		{ 0X02, 0x2d, 0x42 }, //clk
		{ 0X02, 0x3b, 0xe1 }, //18 sync code
		{ 0X02, 0x9A, 0x26 }, //22
		{ 0X02, 0x9B, 0x02 }, //23
		{ 0X02, 0xCE, 0x16 }, //24
		{ 0X02, 0xCF, 0x82 }, //25
		{ 0X02, 0xD0, 0x00 }, //26
		{ 0X02, 0x00, 0x00 }, //27
};
int initIMX222(XSpiPs *spipsptr){
	int status;
	for(int i = 0; i <= REG_NUM; i++){
		for(int j = 0; j <= REG_BYTE; j++){
			spi_wreg[i][j] = f_to_l(spi_wreg[i][j]);
		}
	}
	for(int i = 0; i < REG_NUM; i++){
		status = XSpiPs_PolledTransfer(spipsptr, spi_wreg[i], NULL, REG_BYTE);
		if(status != XST_SUCCESS){
			return status;
		}
	}
	return status;
}

u8 f_to_l(u8 num){
	u8 a = 0;
	u8 out = 0;
	for(int i = 0; i < 8; i++){
		a = 0x01 & (num >> (7-i));
		out = (a << i) | out;
	}
	return out;
}
