int[] color_awake = new int[] {
  //7, 180, 232 //color Clement
  //242, 236, 194
  //5, 229, 222
  255, 222, 2 // color Celine
};
int[] color_light = new int[] {
  //5, 229, 222
  //233, 51, 37
  //7, 180, 232 //color Clement
  52, 180, 49 //color Celine
}; 
float[] color_deep = new float[] {
  //255, 163, 0 color Clement
  //7, 18, 229
  21, 29, 195 // color Celine
};
float[] color_rem = new float[] {
  //202, 7, 232//color clem
  //41, 182, 151
  234, 6, 6 // color Celine
};


void setup() {
size(800, 800);
background(255);    // Setting the background to white
background(color_awake[0], color_awake[1], color_awake[2], 40);
stroke(0);          // Setting the outline (stroke) to black
//noStroke();
line(0,0,800,800);
//fill(150);          // Setting the interior of a shape (fill) to grey
noFill();
rect(50,50,75,100); // Drawing the rectangle
}
