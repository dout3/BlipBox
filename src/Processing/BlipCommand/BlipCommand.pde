import controlP5.*;

ProcessingBlipBox bli
pbox;
ControlP5 controlP5;
//DropdownList p1, p2;
ListBox l1;

int lastx = -1;
int lasty = -1;
int brightness = 0xff;
int ratiox, ratioy;
boolean draw = false;

void setup(){
  size(800, 640);
  blipbox = new ProcessingBlipBox(this, 0);
  controlP5 = new ControlP5(this);
  ratiox = (width-200)/9;
  ratioy = (height-200)/7;
  l1 = controlP5.addListBox("command", 0, 0, 180, 80);
  //l1.actAsPulldownMenu(true);
  for(Command cmd: Command.values()){
    l1.addItem(cmd.name, cmd.ordinal());
  }
  controlP5.addButton("toggleDraw", 10, 200, 0, 80, 12).setLabel("draw");
  controlP5.addSlider("brightness", 0, 255, 255, 200, 13, 80, 12);
}

void brightness(float value){
  this.brightness = (int)value;
  println("brightness "+brightness);
  blipbox.setParameterValue(Parameter.BRIGHTNESS, brightness);
}

void parameter(Parameter param, int value){
  println("param "+param+": "+value);
}

void toggleDraw(int value){
  println("value "+value);
  draw = !draw;
}

void controlEvent(ControlEvent event) {
  if(event.isGroup()){
    Command cmd = Command.values()[(int)event.group().value()];
    println("sending command "+cmd);
    blipbox.sendCommand(cmd);  
  }
}

void touchPressed(Position pos){
  println("pressed "+pos);
}

void touchReleased(Position pos){
  println("released "+pos);
  lastx = -1;
  lasty = -1;
}
 
void touchDragged(Position pos){
  println("dragged "+pos);
  if(draw){
    int x = pos.getX(0, 10);
    int y = pos.getY(0, 8);
    if(lastx != x || lasty != y){
      if(blipbox.getLed(x, y) == 0)
        blipbox.setLed(x, y, brightness);
      else
        blipbox.setLed(x, y, 0);
      lastx = x;
      lasty = y;
    }
  }
}

void keyTyped() {
  if(key == 'f')
    blipbox.fill(0xff);
  else if(key == 'c')
    blipbox.fill(0);
  else if(key == 'g')
    blipbox.sendCommand(Command.LEDS_START);
  else if(key == 'h')
    blipbox.sendCommand(Command.LEDS_STOP);
  else if(key == 'k')
    blipbox.sendCommand(Command.CFG_REQUEST);
  else if(key == 43)
    blipbox.sendCommand(Command.BRIGHTEN);
  else if(key == 45)
    blipbox.sendCommand(Command.FADE);
  else if(key == 'd'){
    int val = blipbox.getParameterValue(Parameter.FOLLOW_MODE);
    if(++val > 5)
      val = 0;
    blipbox.setParameterValue(Parameter.FOLLOW_MODE, val);
    println("set follow mode to "+blipbox.getParameterValue(Parameter.FOLLOW_MODE));
  }else if(key > 47 && key < 58){
    brightness = (key - 48)*28+1; // keys 0-9 scaled to 1-253
  }
}

int getScreenX(){
  return (mouseX-100) / ratiox;
}

int getScreenY(){
  return (mouseY-100) / ratioy;
}

boolean mouseOnBox(){
  return mouseX >= 100 && mouseY >= 100;
}

boolean painting;
void mouseReleased(){
  painting = false;
}

void mousePressed(){
  if(mouseOnBox()){
    painting = blipbox.getLed(getScreenX(), getScreenY()) == 0;
    mouseDragged();
  }
}

void mouseDragged(){
  if(mouseOnBox()){
  int bx = getScreenX();
  int by = getScreenY();
  if(painting){
    println("set led "+bx+"/"+by);
    blipbox.setLed(bx, by, brightness);
  }else{
    blipbox.setLed(bx, by, 0);
  }
  }
}

void draw(){
  background(0xff);
  fill(0x0);
  rect(100, 100, width-120, height-120);
  pushMatrix();
  translate(120, 120);
  for(int x=0; x<10; ++x){
    for(int y=0; y<8; ++y){
      fill(204, 102, 0, 127);
      ellipse(x*ratiox, y*ratioy, 22, 22);
      fill(blipbox.getLed(x, y), 0, 0);
      ellipse(x*ratiox+1, y*ratioy+1, 20, 20);
    }
  }
  popMatrix();
}

void stop() {
  blipbox.stop();
  super.stop();
}

