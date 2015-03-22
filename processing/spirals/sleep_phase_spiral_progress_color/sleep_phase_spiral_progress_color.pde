float x, y;
float angle = 0.0;
float scalar = 0;
/////////////////////////////////////
/////////////////////////////////////
/// YOU CAN CHANGE THE "SPEED" HERE
float speed = 0.15; //0.15; //0.05; //parameters
/////////////////////////////////////
/////////////////////////////////////

/////////////////////////////////////
/////////////////////////////////////
/// YOU CAN CHANGE THE COLORS HERE
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
//0 Wake R: 242 G: 236 B: 194
//1 Light Sleeping R: 233 G: 51 B: 37
//2 Deep Sleeping R: 7 G: 18 B: 229
//3 REM R: 41 G: 182 B: 151
///////////////////////////////////////
///////////////////////////////////////


Table csv_sleep_phase;
TableRow row;
TableRow previous_row;
int idx = 0;
///////////////////////////////////////
///////////////////////////////////////
// YOU CAN CHANGE HOW MANY TIME IS REPEATED ONE POINT OF DATA (each 5 min normaly).
final int max_idx_before_change = 9; //99; //9;
///////////////////////////////////////
///////////////////////////////////////
//int change_idx = 10; //100; //10;
int change_idx = max_idx_before_change + 1;

int sleep_phase;
String date;
String time;
String phase_name;

void setup() {
  ///////////////////////////////////////
  ///////////////////////////////////////
  // YOU CAN CHANGE THE WINDOW PROPERTIES
  size(800, 800);
  frameRate(50);//frameRate(250);
  //background(0);
  background(color_awake[0], color_awake[1], color_awake[2], 40);
  //background(167, 165, 27, 40);
  stroke(500);
  ///////////////////////////////////////
///////////////////////////////////////
  //println("color AwAkE: " + color_awake[0] +" "+ color_awake[1] +" "+ color_awake[2]);
  //println("color lIght: " + color_light[0] +" "+ color_light[1] +" "+ color_light[2]);

  // Load the csv table
  csv_sleep_phase = loadTable("../../../data/stages_with_id.csv", "header");
  //row = csv_sleep_phase.rows();
}

void draw() {
  // get row in csv table
  if (max_idx_before_change < change_idx) {

      row = csv_sleep_phase.getRow(idx);
      change_idx = 0;
    
  }
  else {
    row = previous_row;
    change_idx += 1;
  }

  // get data of current row
  //int sleep_phase = row.getInt("sleep_phase");
  //String date = row.getString("date");
  //String time = row.getString("time");
  //String phase_name = "None";
  try{
    sleep_phase = row.getInt("sleep_phase");
    date = row.getString("date");
    time = row.getString("time");
    //phase_name = "None";
  } catch (ArrayIndexOutOfBoundsException e) {
    println("end of file!");
    int sleep_phase = 9999;
    phase_name = "End";
    int no_limit = 1;
    //while(no_limit > 0) {
    while(1 > 0) {
      no_limit += 1;
    }
  }
  
  switch (sleep_phase) {
  case 0: 
    phase_name = "AwAkE";
    break;
  case 1: 
    phase_name = "lIght";
    break;
  case 2: 
    phase_name = "dEEp";
    break;
  case 3: 
    phase_name = "rEm";
    break;
  }
  println(date + " " + time + " (" + sleep_phase + ") " + phase_name);

  // generate a random color
  //float rand_phase = random(4);
  //println("random number:" + rand_phase);

  // set the phase color
  float rand_phase = sleep_phase; 

  // Plot the circle-dot on the spiral according to the current sleeping phase
  if (rand_phase < 1)
    fill (color_awake[0], color_awake[1], color_awake[2]);
  else if (rand_phase < 2)
    fill (color_light[0], color_light[1], color_light[2]);
  else if (rand_phase < 3)
    fill (color_deep[0], color_deep[1], color_deep[2]);
  else if (rand_phase < 4)
    fill (color_rem[0], color_rem[1], color_rem[2]);
  ///////////////////////////////////////
///////////////////////////////////////
// YOU CAN CHANGE THE EQUATION OF THE SPIRAL
  x = width/2 + cos(angle) * scalar;
  y = height/2 + sin(angle) * scalar;
  ///////////////////////////////////////
///////////////////////////////////////

///////////////////////////////////////
///////////////////////////////////////
// YOU CAN CHANG THE SHAPE AND SIZE OF THE DOT-CIRCLES
  //ellipse( x, y, 5, 5);
  ellipse( x, y, 5, 5); // set the size of cirlces
  ///////////////////////////////////////
///////////////////////////////////////
  
  // increment variables
  angle += speed;
  ///////////////////////////////////////
///////////////////////////////////////
  // YOU CAN CHANGE ANGULAR CHANGE AT EACH TIME STEP
  scalar += 0.2; //0.2; //0.1;
  ///////////////////////////////////////
///////////////////////////////////////
  idx += 1;
  change_idx += 0;
  previous_row = row;
}

