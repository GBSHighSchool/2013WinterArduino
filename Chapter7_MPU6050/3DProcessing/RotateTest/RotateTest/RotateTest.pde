
int i = 0;
void setup() {
  size(200, 200, P3D);
  translate(width/2, height/2);
}

void draw() {
  background(0);
  i = i + 5;
  if (i > 360) {
    i = 0;
  }
    
   translate(width/2, height/2);
   //rotateX(PI/180*i);
   //rotateY(PI/180*i);
   rotateZ(PI/180*i);
   
   ellipse(0, 0, 5, 5);
   rect(-26, -26, 52, 52);
}
