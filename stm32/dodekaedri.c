#include <stm32f4xx.h>
#include <stm32f4xx_rcc.h>
#include <stm32f4xx_gpio.h>
#include <stm32f4xx_i2c.h>
#include <stm32f4xx_usart.h>

#include "uart.h"
#include "i2c.h"
#include "synth.h"

void SystemInit() {
}

const uint8_t addr_rfc = 0x1A;   // WM8731 used for zero-IF signal
const uint8_t addr_afc = 0x1B;   // WM8731 used for microphone and headphone audio
void assert_failed(uint8_t *file, uint32_t line) {
	print("\r\nAssert failed: ");
	print((char*)file);
	print(" ");
	printdec(line);
	print("\r\n");
}

// The WM8731 registers have 7-bit addresses and 9-bit data
// so the highest data bit of each register
// is in lowest bit of the first byte.
#define RFC_INIT_SIZE 11
const uint8_t rfc_init[RFC_INIT_SIZE][2] = {
{0x1E, 0x00}, // reset it first
{0x00, 0x1F}, // maximum L line input volume, no mute
{0x02, 0x1F}, // maximum R line input volume, no mute
{0x04, 0x7F}, // maximum L headphone volume
{0x06, 0x7F}, // maximum R headphone volume
{0x08, 0x12},
{0x0A, 0x00},
{0x0C, 0x02}, // power down mic bias
{0x0E, 0x02}, // I2S format, 16-bit input audio data, slave mode
{0x10, 0x00}, // (256fs oversampling, no frequency dividers), 48 kHz ADC and DAC
{0x12, 0x01}  // activate interface
};


#define TFT_SPI SPI1
#define TFT_CS_GPIO GPIOB
#define TFT_CS_Pin GPIO_Pin_6
#define TFT_DC_Pin GPIO_Pin_4

void tft_send(uint8_t *bytes, int n, int dc) {
	int i;
	if(dc) // data
		TFT_CS_GPIO->ODR |= TFT_DC_Pin;
	else // command
		TFT_CS_GPIO->ODR &= ~TFT_DC_Pin;
	TFT_CS_GPIO->ODR &= ~TFT_CS_Pin;
	for(i = 0; i < n; i++) {
		while(!SPI_I2S_GetFlagStatus(TFT_SPI, SPI_I2S_FLAG_TXE));
		SPI_I2S_SendData(TFT_SPI, bytes[i]);
	}
	while(SPI_I2S_GetFlagStatus(TFT_SPI, SPI_I2S_FLAG_BSY));
	TFT_CS_GPIO->ODR |= TFT_CS_Pin;
}


/* Functions used by the Adafruit TFT library for Arduino: */
void writecommand(uint8_t v) {
	tft_send(&v, 1, 0);
	/*print("TFT command: ");
	printhex(v);
	print("\r\n");*/
}

void writedata(uint8_t v) {
	tft_send(&v, 1, 1);
}

void delay(int ms) {
	// some delay
	int i, j;
	for(i = 0; i < ms; i++) {
		for(j = 0; j < 5000; j++) __asm("nop");
	}
}
#include "tft/tft.h"



int main() {
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	uart_init();

	i2c_init();
	synth_init();

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

	GPIO_Init(TFT_CS_GPIO, &(GPIO_InitTypeDef) {
		.GPIO_Pin = TFT_CS_Pin | TFT_DC_Pin,
		.GPIO_Mode = GPIO_Mode_OUT,
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
		.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2,
		.SPI_FirstBit = SPI_FirstBit_MSB,
		.SPI_CRCPolynomial = 7 // default value
	});
	SPI_Cmd(SPI1, ENABLE);


	// Main PLL and I2S PLL initialization
	RCC_PLLI2SCmd(DISABLE); // PLLI2SConfig should be called with PLLI2S disabled

	// PLLI2S clock source is common with main PLL configured with RCC_PLLConfig.
	// Using 26 MHz clock input (HSE)
	RCC_HSEConfig(RCC_HSE_Bypass);
	print("Waiting for HSE\r\n");
	RCC_WaitForHSEStartUp();
	print("HSE started up\r\n");

	RCC_PLLConfig(RCC_PLLSource_HSE, 13, 50, 2, 4);
	RCC_PLLCmd(ENABLE);

	RCC_I2SCLKConfig(RCC_I2S2CLKSource_PLLI2S);
	RCC_PLLI2SConfig(72,3);
	RCC_PLLI2SCmd(ENABLE);

	print("Waiting for PLLI2S\r\n");
	while(!RCC_GetFlagStatus(RCC_FLAG_PLLI2SRDY));
	print("PLLI2S ready\r\n");

	// I2S2 initialization
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE); // I2S2
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource12, GPIO_AF_SPI2); // I2S2_WS
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource13, GPIO_AF_SPI2); // I2S2_CK
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource15, GPIO_AF_SPI2); // I2S2_SD
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource6,  GPIO_AF_SPI2); // I2S2_MCK
	GPIO_Init(GPIOB, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_15,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});
	GPIO_Init(GPIOC, &(GPIO_InitTypeDef) {
		.GPIO_Pin = GPIO_Pin_6,
		.GPIO_Mode = GPIO_Mode_AF,
		.GPIO_Speed = GPIO_Speed_50MHz,
		.GPIO_OType = GPIO_OType_PP,
		.GPIO_PuPd = GPIO_PuPd_NOPULL
	});

	I2S_Init(SPI2, &(I2S_InitTypeDef) {
		.I2S_Mode = I2S_Mode_MasterTx,
		.I2S_Standard = I2S_Standard_Phillips,
		.I2S_DataFormat = I2S_DataFormat_16b,
		.I2S_MCLKOutput = I2S_MCLKOutput_Enable,
		.I2S_AudioFreq = I2S_AudioFreq_48k,
		.I2S_CPOL = I2S_CPOL_Low
	});
	I2S_Cmd(SPI2, ENABLE);


	// I2S3 initialization
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI3, ENABLE); // I2S3
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


	// Initialize display
	Adafruit_ST7735_commandList(Rcmd1);
	Adafruit_ST7735_commandList(Rcmd2red);
	Adafruit_ST7735_commandList(Rcmd3);

	writecommand(0x2A); // column address set
	writedata(0);
	writedata(0);
	writedata(0);
	writedata(128);
	writecommand(0x2B); // row address set
	writedata(0);
	writedata(0);
	writedata(0);
	writedata(240);
	writecommand(0x2C); // memory write

	int y;
	for(y = 0; y < 240; y++) {
		int x;
		for(x = 0; x < 128; x++) {
			writedata(x ^ y);
		}
	}

	uint16_t audio = 0;
	for(;;) {
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
