import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;
import ketai.ui.*;
import ketai.net.*;
import controlP5.*;
KetaiBluetooth bt; 
boolean isConfiguring = true; 
KetaiList klist; 
ArrayList devicesDiscovered = new ArrayList(); 
ControlP5 cp5;
int margin = 150;
boolean ledState = false; 

void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
bt = new KetaiBluetooth(this); 
}
void onActivityResult(int requestCode, int resultCode, Intent data) {
bt.onActivityResult(requestCode, resultCode, data);
}
void setup() {
size(displayWidth, displayHeight);
orientation(PORTRAIT); 
bt.start(); 
isConfiguring = true; 
PFont font = createFont("Arial", 40);
ControlFont cf = new ControlFont(font);
int buttonSize = min(width, height) - 2 * margin; 
cp5 = new ControlP5(this);
Button btnLED = new Button(cp5, "buttonLED");
btnLED.setPosition(margin, (height - buttonSize) / 2);
btnLED.setSize(buttonSize, buttonSize);
btnLED.setCaptionLabel("Turn ON the LED");
btnLED.getCaptionLabel().setControlFont(cf);
btnLED.getCaptionLabel().toUpperCase(false);
btnLED.getCaptionLabel().alignX(CENTER);
}
void draw() {
if (isConfiguring) { 
klist = new KetaiList(this, bt.getPairedDeviceNames());
isConfiguring = false;
}

}

public void controlEvent(ControlEvent theEvent) {
String controllerName = theEvent.controller().name();
if(controllerName == "buttonLED"){ 
Button btn = (Button)theEvent.controller();
if(ledState){
ledState = false; // LED 
btn.setCaptionLabel("Turn ON the LED"); 
byte[] data = {'O', 'F', 'F', '\r'}; // LED 
bt.broadcast(data); // LED 
}
else{
ledState = true; // LED 
btn.setCaptionLabel("Turn OFF the LED");
byte[] data = {'O', 'N', '\r'}; 
bt.broadcast(data); 
}
}
}
void onKetaiListSelection(KetaiList klist) {
String selection = klist.getSelection(); 
bt.connectToDeviceByName(selection); 
klist = null; 
}



public void controlEvent(ControlEvent theEvent) {
String controllerName = theEvent.controller().name();
if(controllerName == "buttonLED"){ 
Button btn = (Button)theEvent.controller();
if(ledState){
ledState = false; // LED 
btn.setCaptionLabel("Turn ON the LED"); 
byte[] data = {'O', 'F', 'F', '\r'}; 
bt.broadcast(data); // LED 
}
else{
ledState = true; // LED 
btn.setCaptionLabel("Turn OFF the LED"); 
byte[] data = {'O', 'N', '\r'}; 
bt.broadcast(data); //
}
}
}
void onKetaiListSelection(KetaiList klist) {
String selection = klist.getSelection(); 
bt.connectToDeviceByName(selection); 
klist = null; 
}

