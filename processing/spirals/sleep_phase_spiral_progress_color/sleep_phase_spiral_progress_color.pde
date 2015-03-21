float x, y;
float angle = 0.0;
float scalar = 0;
float speed = 0.05;
int[] color_awake = new int[] {7, 180, 232};
int[] color_light = new int[] {5, 229, 222}; 
float[] color_deep = new float[] {255, 163, 0};
float[] color_rem = new float[] {202, 7, 232};

void setup(){
  size(800,800);
  frameRate(250);
  background(0);
  stroke(500);
  println("color AwAkE: " + color_awake[0] +" "+ color_awake[1] +" "+ color_awake[2]);
  println("color lIght: " + color_light[0] +" "+ color_light[1] +" "+ color_light[2]);
}
void print_test() {
  println("coucou");
}
void draw(){
  //fill (random(255), random(255), random (255));
  //fill (color_awake[0], color_awake[1], color_awake[2]);
  float rand_phase = random(4);
  println("random number:" + rand_phase);
  if (rand_phase < 1)
    fill (color_awake[0], color_awake[1], color_awake[2]);
  else if (rand_phase < 2)
    fill (color_light[0], color_light[1], color_light[2]);
  else if (rand_phase < 3)
    fill (color_deep[0], color_deep[1], color_deep[2]);
  else if (rand_phase < 4)
    fill (color_rem[0], color_rem[1], color_rem[2]);
  x = width/2 + cos(angle) * scalar;
  y = height/2 + sin(angle) * scalar;
  ellipse( x, y, 5, 5);
  angle += speed;
  scalar += 0.1;
}

