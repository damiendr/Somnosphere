PFont fa;                          // STEP 2 Declare PFont variable
PFont fh;  

void setup() {
  size(800, 800);
  fa = createFont("Arial", 16, true); // STEP 3 Create Font
  fh = createFont("Helvetica", 16, true); // STEP 3 Create Font
}

void draw() {
  background(100);
  textFont(fa, 16);                 // STEP 4 Specify font to be used
  fill(0);                        // STEP 5 Specify font color 
  text("Hello Strings!", 10, 10);  // STEP 6 Display Text
  
  //awake
  textFont(fh, 16);                 
  colorMode(HSB, 100);
  fill(color(52*100/360f, 99, 100));                         
  text("Awake", 50, 100);  
  
  //light
  textFont(fh, 16);                 
  colorMode(HSB, 100);
  fill(color(119*100/360f, 73, 71));                         
  text("Light", 100, 200);  
  
  //deep
  textFont(fh, 16);                 
  colorMode(HSB, 100);
  fill(color(237*100/360f, 89, 76));                         
  text("Deep", 200, 300);
  
  //REM
  textFont(fh, 16);                 
  colorMode(HSB, 100);
  fill(color(0*100/360f, 97, 92));                         
  text("REM", 300, 200);
}

