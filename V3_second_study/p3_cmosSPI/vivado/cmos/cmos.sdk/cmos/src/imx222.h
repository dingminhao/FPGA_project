#ifndef SRC_IMX222_H_
#define SRC_IMX222_H_
#include "xspips.h"
#define REG_NUM 29
#define REG_BYTE 3
int initIMX222(XSpiPs *spipsptr);
u8 f_to_l(u8 num);


#endif
