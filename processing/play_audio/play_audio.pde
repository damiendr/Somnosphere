
import ddf.minim.*;

static int NUM_WAVES=12;

static int advance = 2000;
static float step = 1000f;
static int BUF_WIDTH=(int)(128*step/1000f);

Minim minim;
AudioPlayer player_wave;
AudioPlayer player;
int last_pos = 0;
float offset = 0;
int last_sec = 0;
Table table;

float[][] audio_bufs = new float[BUF_WIDTH][NUM_WAVES];

PFont textfont;


void setup()
{
  size(800, 600, P3D);

  textfont = createFont("Bebas Neue", 26, true);
  
  minim = new Minim(this);

  // load SD.wav from the data folder
  //snare = minim.loadSample("SD.wav", 512);
//  sample = minim.loadSample("../../../data/loris_one_hour_modulated_both.aiff", 512);

  player_wave = minim.loadFile("../../data/onehour_2011-06-22_50Hz.aiff", BUF_WIDTH);
  player_wave.mute();

  player = minim.loadFile("../../data/loris_one_hour_modulated_both_compressed.aiff", BUF_WIDTH);

  player_wave.cue(advance);
  player_wave.play();
  player.play();
  
  println(player_wave.bufferSize());
  
  table = loadTable("../../data/sleep_stages_levels.csv","header");


//  if ( sample == null ) println("Didn't get sample!");
//  sample.trigger();
}

float inc = 1.0f;

void draw()
{
  
  
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  
//  float sample = player_wave.left.get(0);
  int pos = player.position(); 


  int row_idx = (int)(pos / 30000f);
  TableRow row = table.getRow(row_idx); 
  float h = row.getFloat("level");
  String time = row.getString("datetime").substring(0, 5) + " am";

  String phase = "";
  if (h < 0.1) {
    phase = "Awake";
  }
  else if (h < 0.5) {
    phase = "Light Sleep";
  }
  else if (h < 0.8) {
    phase = "Deep Sleep";
  }
  else {
    phase = "REM Sleep";
  }

  background(0);
  color c = color(14+86*h, 100, 100);
  fill(c); //255*baseline/(float)(height-100));
  
  textFont(textfont);
  
  textSize(26);
  textAlign(CENTER, TOP);
  text(time, width/2, 20);

  textAlign(RIGHT, TOP);
  text(phase, width-20, 20);
  

  offset = (pos % step);
  int sec = (int)(pos / step);
  if (last_sec != sec) {
    last_sec = sec;
//  if (sample != last_sample) {
//   last_sample = sample;
    for (int i = 0; i < BUF_WIDTH; i++) {
      for (int j = 1; j < NUM_WAVES; j++) {
        audio_bufs[i][j-1] = audio_bufs[i][j];
      }
    }
    for (int i = 0; i < BUF_WIDTH; i++) {
      audio_bufs[i][NUM_WAVES-1] = player_wave.left.get(i)*1000;
    }
  }
  
  colorMode(HSB, 100);

  for (int j = 0; j < NUM_WAVES; j++) {
    int baseline = (int)(100 + (-offset + j*step) * 45 / step);
    c = color(14+86*h, 100, 100*pow((baseline-100)/(float)(height), 0.5f));
    stroke(c); //255*baseline/(float)(height-100));
    for(int i = 0; i < BUF_WIDTH - 1; i++)
    {
      float x1 = map( i, 0, BUF_WIDTH, 0, width );
      float x2 = map( i+1, 0, BUF_WIDTH, 0, width );
      line( x1, baseline + audio_bufs[i][j], x2, baseline + audio_bufs[i+1][j] );
    }
  }
}

void mouseClicked() {
  int pos = player.position();
  player.cue(pos + 5000 * 60);
  player_wave.cue(pos + 5000 * 60 + advance);
}

void keyPressed() {
  if (key == ' ') {
     if (player.isPlaying()) {
      player_wave.pause();
      player.pause();      
    }
    else {
      player_wave.play();
      player.play();
    }
  }
}

