#ifndef _CHARACTERS_H_
#define _CHARACTERS_H_

#include <stdint.h>

// defines each character as a byte[5] with 3x5 pixels (4x6 font)
// each byte is a row of three pixels right aligned
// #define CHAR_0 { 0x2, 0x5, 0x5, 0x5, 0x2 }
// #define CHAR_1 { 0x2, 0x6, 0x2, 0x2, 0x7 }
// #define CHAR_2 { 0x6, 0x1, 0x2, 0x4, 0x7 }
// #define CHAR_3 { 0x6, 0x1, 0x2, 0x1, 0x6 }
// #define CHAR_4 { 0x1, 0x5, 0x7, 0x1, 0x1 }
// #define CHAR_5 { 0x7, 0x4, 0x6, 0x1, 0x6 }
// #define CHAR_6 { 0x3, 0x4, 0x6, 0x5, 0x2 }
// #define CHAR_7 { 0x7, 0x1, 0x2, 0x2, 0x2 }
// #define CHAR_8 { 0x2, 0x5, 0x2, 0x5, 0x2 }
// #define CHAR_9 { 0x2, 0x5, 0x3, 0x1, 0x6 }

struct Character { char c; uint8_t d[5]; };

// class Characters {
// public:
Character& getCharacter(char c);
// };

#endif /* _CHARACTERS_H_ */