#ifndef _ANALOGREADER_H_
#define _ANALOGREADER_H_

#include <inttypes.h>
/* #include "defs.h" */

#define ADC_CHANNELS 6

extern uint16_t adc_values[ADC_CHANNELS];

void setup_adc();

#define getAnalogValue(i) adc_values[i]

#endif /* _ANALOGREADER_H_ */
