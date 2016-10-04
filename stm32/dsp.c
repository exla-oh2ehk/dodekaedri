#include <stdint.h>
#include <stm32f4xx_spi.h>
#include <stm32f4xx_usart.h>
#include <arm_math.h>

#include "dodekaedri.h"
#include "dsp.h"

#if 1
#define FIRLEN 32
int16_t filtertaps0[FIRLEN] = {-5799,-8143,-10073,-11233,-11315,-10104,-7508,-3581,1473,7319,13513,19552,24919,29141,31839,32767,31839,29141,24919,19552,13513,7319,1473,-3581,-7508,-10104,-11315,-11233,-10073,-8143,-5799,0};
int16_t filtertaps1[FIRLEN] = {571,-964,-3493,-6884,-10880,-15121,-19182,-22611,-24984,-25951,-25282,-22893,-18863,-13434,-6986,0,6986,13434,18863,22893,25282,25951,24984,22611,19182,15121,10880,6884,3493,964,-571,0};
#else
// a short test filter to see how fast the code runs
#define FIRLEN 4
int16_t filtertaps0[FIRLEN] = {100,200,300,400};
int16_t filtertaps1[FIRLEN] = {400,500,600,700};
#endif

int16_t firbuf0[2*FIRLEN], firbuf1[2*FIRLEN];
int16_t *firp0 = firbuf0, *firp1 = firbuf1;
int firidx = 0;


#define SPIFLAG(spi, flag) ((spi)->SR & (flag))
int sawtooth = 0;
int16_t rxsamp[2], txsamp[2];
uint32_t agc_filter = 0;
void SPI2_IRQHandler() {
	//int64_t outr = 0, outi = 0, out;
	/* Handler for empty TX buffer in SPI2:
	   read I2S_FLAG_CHSIDE to see if the TX buffer is
	   waiting for left or right channel.
	*/
	DEV_GPIO->ODR |= DEV_PIN;
	if(SPIFLAG(SPI2, I2S_FLAG_CHSIDE)) {
		/* Ready to put "right" channel in TX buffer.
		   We have also received "left" channel. */
		rxsamp[0] = I2S2ext->DR;
		SPI2->DR = txsamp[1];
	} else {
		/* Ready to put "left" channel in TX buffer,
		   i.e. first part of the next sample to transmit.
		   We have now also received "right" channel
		   so we have received one complete sample. */
		rxsamp[1] = I2S2ext->DR;

		// "circular buffer"
		firp0[0] = firp0[FIRLEN] = rxsamp[0];
		firp1[0] = firp1[FIRLEN] = rxsamp[1];
		firidx++;
		if(firidx >= FIRLEN) firidx = 0;
		firp0 = firbuf0 + firidx;
		firp1 = firbuf1 + firidx;

		int64_t acc = 0;
		int i;
		for(i = 0; i < FIRLEN; i+=2) {
			acc += (filtertaps0[i] * firp0[i]);
			acc += (filtertaps1[i] * firp1[i]);
			acc += (filtertaps0[i+1] * firp0[i+1]);
			acc += (filtertaps1[i+1] * firp1[i+1]);
		}
		int32_t o = ((uint64_t)acc) >> 5; // avoid overflow in filter of length 32
		uint32_t o_agc = (o>=0) ? o : -o;
		agc_filter += (o_agc - agc_filter) >> 10;
		uint32_t agc_gain = 0xFFFFFFFFUL / (agc_filter >> 8);

		int32_t out = ((int64_t)o * agc_gain) >> 32;

		if(out > 0x7FFF) out = 0x7FFF;
		else if(out < -0x8000) out = -0x8000;
		if(out > 0x7FFF) out = 0x7FFF;
		else if(out < -0x8000) out = -0x8000;

		txsamp[0] = out;
		txsamp[1] = out;

		SPI2->DR = txsamp[0];
	}
	DEV_GPIO->ODR &= ~DEV_PIN;
}
