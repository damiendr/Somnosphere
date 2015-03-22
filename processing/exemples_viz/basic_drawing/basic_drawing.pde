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

// HSB colors
color c_hsb_awake = color(52*100/360f, 99, 100);
color c_hsb_light = color(119*100/360f, 73, 71);
color c_hsb_deep = color(237*100/360f, 89, 76);
color c_hsb_rem = color(0*100/360f, 97, 92);
//int[] hsb_awake = new int[] {
//  255*100/360f, 222, 2 // color Celine
//};
//int[] hsb_light = new int[] {
//  52*100/360f, 180, 49 //color Celine
//}; 
//float[] hsb_deep = new float[] {
//  21*100/360f, 29, 195 // color Celine
//};
//float[] hsb_rem = new float[] {
//  234*100/360f, 6, 6 // color Celine
//};

//
////setup with RGB colors
//void setup() {
//size(800, 800);
//background(255);    // Setting the background to white
//background(color_awake[0], color_awake[1], color_awake[2]);
//stroke(0);          // Setting the outline (stroke) to black
////noStroke();
//line(0,0,800,800);
////fill(150);          // Setting the interior of a shape (fill) to grey
//noFill();
//rect(50,50,75,100); // Drawing the rectangle
//}

color c;

//setup with HSB colors
void setup() {
  size(800, 800);
  
  noStroke();
  background(255);
  //colorMode(HSB, 100);
  //background(hsb_awake[0], hsb_awake[1], hsb_awake[2]);
  //background(59,97,99);
  stroke(0, 255, 220);
  line(0,0,100,100);
  
  c = color(50, 55, 100);  // Update 'c' with new color
  fill(c);  // Use updated 'c' as fill color
  rect(55, 10, 45, 80);  // Draw right rect
  
  fill(59,97,99);
  ellipse(20,20,16,16);
  
  colorMode(HSB, 100);  // Use HSB with scale of 0-100
  color c_hsb_awake = color(52*100/360f, 99, 100);
  //c = color(52*100/360f, 99, 100);  // Update 'c' with new color
  c = c_hsb_light;
  fill(c);  // Use updated 'c' as fill color
  rect(155, 110, 145, 180);  // Draw right rect
  
  //for (int i = 0; i < 100; i++) {
  //  for (int j = 0; j < 100; j++) {
  //    stroke(i, j, 100);
  //    point(i, j);
  //  }
  //}
}

