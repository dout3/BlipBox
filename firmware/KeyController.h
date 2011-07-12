#ifndef _KEYCONTROLLER_H_
#define _KEYCONTROLLER_H_

#include <stdint.h>
#include "TouchController.h"
#include "Position.h"

/* enum KeyState { */
/*   PRESSED, DRAGGED, RELEASED, UNCHANGED, DISENGAGED */
/* }; */

class KeyController : public TouchController {

public:
  Position pos;
  KeyController() : pressed(false) {}
  void keyscan();

  inline bool isPressed(){
    return pressed;
  }

private:
  void update();
  bool pressed;
};

#endif /* _KEYCONTROLLER_H_ */
