import controlP5.*;
ControlP5 cp5;
Knob myKnob;
void setup(){
  size(displayWidth, displayHeight);
  noStroke();
  cp5 = new ControlP5(this);
  /*
  myKnob = new Knob(cp5, "KnobA"); 
  int knobSize = min(width, height) * 9 / 10;
  myKnob.setRange(0, 255); 
  myKnob.setPosition((width - knobSize) / 2, (height - knobSize) / 2);
  myKnob.setRadius(knobSize / 2); 
  myKnob.setCaptionLabel("Brightness");
  myKnob.setValue(100);
 
 */
 //*
  int knobSize = min(width, height) * 9 / 10;
  myKnob = cp5.addKnob("knob")
           .setRange(0, 255)
           .setPosition((width - knobSize) / 2, (height - knobSize) / 2)
           .setRadius(knobSize / 2)
           .setCaptionLabel("Brightness")
           .setValue(100);
           
 //*/
 
  
}
void draw(){
}
