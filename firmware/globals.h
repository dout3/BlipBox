#ifndef _GLOBALS_H_
#define _GLOBALS_H_

#include "BlipBox.h"

/* #include <avr/wdt.h> */
/* #include "LedController.h" */
/* #include "DisplayManager.h" */
/* #include "KeyController.h" */
/* #include "Animator.h" */
/* #include "Configuration.h" */
/* #include "MessageSender.h" */

extern BlipBox blipbox;

// blocking call to serialRead
/* uint8_t readByte(); */
/* void error(uint8_t code); */

/* void setmode(uint8_t mode); // sets the mode to be used on next system reset */
/* void reset(uint8_t mode); // reset device into new or same mode */

// note that the wdt has to be disabled on startup after this has been called

// disable the watchdog after a reset:
// Function Prototype
/* void disable_watchdog(); */
// attributes cause device to hang or reboot?
/* void disable_watchdog() __attribute__((naked)) __attribute__((section(".init3"))); */
/* void wdt_init(void) __attribute__((naked)) __attribute__((section(".init3"))); */

#endif /* _GLOBALS_H_ */
