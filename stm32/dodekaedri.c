#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_i2c.h"
#include "stm32f4xx_usart.h"

// SI5351 register map generated by ClockBuilder
// (only for initial test, probably not going to be actually used)
#define code
#include "register_map.h"
#undef code

void SystemInit() {
}

uint8_t a = 0x60;

int i2cdelay = 20;
void i2c_delay() {
	int d;
	for(d = 0; d < i2cdelay; d++) __asm("nop");
}

// SCL 8, SDA 9
#define I2C_SCL 0x100
#define I2C_SDA 0x200

void writereg(uint8_t addr, uint8_t reg, uint8_t v) {
	int i;
	uint32_t odr = GPIOB->ODR & (~(I2C_SCL | I2C_SDA));
	uint32_t allbits;
	// start
	GPIOB->ODR = odr | I2C_SCL;
	i2c_delay();
	GPIOB->ODR = odr;
	i2c_delay();

	allbits =
	(addr << (9*2+2)) | (0 << (9*2+1)) | (1 << (9*2)) |
	(reg  << (9*1+1)) |                  (1 << (9*1)) |
	(v    << (9*0+1)) |                  (1 << (9*0));
	for(i = 0; i < 9*3; i++) {
		uint32_t odr_bit;
		if(allbits & (1 << (9*3-1)))
			odr_bit = odr | I2C_SDA;
		else
			odr_bit = odr;
		allbits <<= 1;
		// send bit
		GPIOB->ODR = odr_bit;
		i2c_delay();
		GPIOB->ODR = odr_bit | I2C_SCL;
		i2c_delay();
		GPIOB->ODR = odr_bit;
		i2c_delay();
	}

	// stop
	GPIOB->ODR = odr | I2C_SCL;
	i2c_delay();
	GPIOB->ODR = odr | I2C_SCL | I2C_SDA;
	i2c_delay();
}


int usart_enabled = 0;
void print(char *data) {
	/* Send text to USART2 */
	if(usart_enabled == 0) return;
	for(; *data != '\0'; data++) {
		/*while(!USART_GetFlagStatus(USART2, USART_FLAG_TXE));
		USART_SendData(USART2, (uint8_t)*data);*/
		while(!(USART2->SR & USART_SR_TXE));
		USART2->DR = (uint8_t)*data;
	}
}

void assert_failed(uint8_t *file, uint32_t line) {
	char l[9] = "      \r\n";
	print("\r\nAssert failed: ");
	print((char*)file);
	l[5] = '0' + line % 10;
	l[4] = '0' + (line / 10) % 10;
	l[3] = '0' + (line / 100) % 10;
	l[2] = '0' + (line / 1000) % 10;
	l[1] = '0' + (line / 10000);
	print(l);
}



int main() {
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	// USART2 initialization
	// USART2 is used to communicate with PC on the Nucleo board
	RCC_AHB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_USART2); // USART2_TX
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_USART2); // USART2_RX
	GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_UP
	});
	USART_Init(USART2, &(USART_InitTypeDef) {
		.USART_BaudRate = 115200,
		.USART_WordLength = USART_WordLength_8b,
		.USART_StopBits = USART_StopBits_1,
		.USART_Parity = USART_Parity_No,
		.USART_Mode = USART_Mode_Tx | USART_Mode_Rx,
		.USART_HardwareFlowControl = USART_HardwareFlowControl_None
	});
	USART_Cmd(USART2, ENABLE);
	usart_enabled = 1;
	print("\r\nHello world\r\n");

	// SPI1 initialization
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_SPI1);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_SPI1);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource7, GPIO_AF_SPI1);
	GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	SPI_Init(SPI1, &(SPI_InitTypeDef) {
		.SPI_Direction = SPI_Direction_1Line_Tx,
		.SPI_Mode = SPI_Mode_Master,
		.SPI_DataSize = SPI_DataSize_8b,
		.SPI_CPOL = SPI_CPOL_Low,
		.SPI_CPHA = SPI_CPHA_1Edge,
		.SPI_NSS = SPI_NSS_Soft,
		.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_16,
		.SPI_FirstBit = SPI_FirstBit_MSB,
		.SPI_CRCPolynomial = 0
	});
	SPI_Cmd(SPI1, ENABLE);


	// bit banged I2C pins
	GPIO_Init(GPIOB, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9,
		.GPIO_Mode = GPIO_Mode_OUT,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_OD,
		.GPIO_PuPd = GPIO_PuPd_UP
	});


	// I2S PLL initialization
	RCC_PLLI2SCmd(DISABLE); // PLLI2SConfig should be called with PLLI2S disabled

	// PLLI2S clock source is common with main PLL configured with RCC_PLLConfig.
	// HSI (internal RC oscillator) is now used for initial tests.
	RCC_PLLConfig(RCC_PLLSource_HSI, 8, 50, 2, 4);
	RCC_PLLCmd(ENABLE);

	RCC_I2SCLKConfig(RCC_I2S2CLKSource_PLLI2S);
	RCC_PLLI2SConfig(72,3);
	RCC_PLLI2SCmd(ENABLE);
	while(!RCC_GetFlagStatus(RCC_FLAG_PLLI2SRDY));
	RCC_I2SCLKConfig(700); // test assert

	// I2S2 initialization
	RCC_APB2PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE); // I2S2
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource12, GPIO_AF_SPI2); // I2S2_WS
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource13, GPIO_AF_SPI2); // I2S2_CK
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource15, GPIO_AF_SPI2); // I2S2_SD
	GPIO_Init(GPIOB, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_15,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	I2S_Init(SPI2, &(I2S_InitTypeDef) {
		.I2S_Mode = I2S_Mode_MasterTx,
		.I2S_Standard = I2S_Standard_Phillips,
		.I2S_DataFormat = I2S_DataFormat_16b,
		.I2S_MCLKOutput = I2S_MCLKOutput_Disable,
		.I2S_AudioFreq = I2S_AudioFreq_48k,
		.I2S_CPOL = I2S_CPOL_Low
	});
	I2S_Cmd(SPI2, ENABLE);


	// I2S3 initialization
	RCC_APB2PeriphClockCmd(RCC_APB1Periph_SPI3, ENABLE); // I2S3
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_SPI3); // I2S3_CK
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource12, GPIO_AF_SPI3); // I2S3_SD
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource15, GPIO_AF_SPI3); // I2S3_WS
	GPIO_Init(GPIOA, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_15,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});
	GPIO_Init(GPIOC, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_12,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	I2S_Init(SPI3, &(I2S_InitTypeDef) {
		.I2S_Mode = I2S_Mode_MasterTx,
		.I2S_Standard = I2S_Standard_Phillips,
		.I2S_DataFormat = I2S_DataFormat_16b,
		.I2S_MCLKOutput = I2S_MCLKOutput_Disable,
		.I2S_AudioFreq = I2S_AudioFreq_48k,
		.I2S_CPOL = I2S_CPOL_Low
	});
	I2S_Cmd(SPI3, ENABLE);



	// init SI5351
	int reg_i;
	for(reg_i = 0; reg_i < NUM_REGS_MAX; reg_i++) {
		writereg(a, Reg_Store[reg_i].Reg_Addr, Reg_Store[reg_i].Reg_Val);
	}

	uint16_t audio = 0;
	for(;;) {
		print("a");
		while(!SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE));
		SPI_I2S_SendData(SPI2, audio);
		SPI_I2S_SendData(SPI3, -audio);
		SPI_I2S_SendData(SPI1, 0x55);
		audio += 1234;
	}
	return 0;
}

void _exit(__attribute__((unused)) int asdf) {
	for(;;);
}
