/**
  * This sketch demonstrates how to use the <code>loadSample</code> method of <code>Minim</code>. 
  * The <code>loadSample</code> method allows you to specify the sample you want to load 
  * with a <code>String</code> and optionally specify what you want the buffer size of the 
  * returned <code>AudioSample</code> to be. Minim is able to load wav files, au files, aif
  * files, snd files, and mp3 files. When you call <code>loadSample</code>, if you just 
  * specify the filename it will try to load the sample from the data folder of your sketch. 
  * However, you can also specify an absolute path (such as "C:\foo\bar\thing.wav") and the 
  * file will be loaded from that location (keep in mind that won't work from an applet). 
  * You can also specify a URL (such as "http://www.mysite.com/mp3/song.mp3") but keep in mind 
  * that if you run the sketch as an applet you may run in to security restrictions 
  * if the applet is not on the same domain as the file you want to load. You can get around 
  * the restriction by signing all of the jars in the applet.
  * <p>
  * An <code>AudioSample</code> is a special kind of file playback that allows
  * you to repeatedly <i>trigger</i> an audio file. It does this by keeping the
  * entire file in an internal buffer and then keeping a list of trigger points.
  * <code>AudioSample</code> supports up to 20 overlapping triggers, which
  * should be plenty for short sounds. It is not advised that you use this class
  * for long sounds (like entire songs, for example) because the entire file is
  * kept in memory.
  * <p>
  * Use 'k' and 's' to trigger a kick drum sample and a snare sample, respectively. 
  * You will see their waveforms drawn when they are played back.
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

import ddf.minim.*;

static int NUM_WAVES=12;

static int advance = 2000;
static float step = 1500f;
static int BUF_WIDTH=(int)(128*step/1000f);

Minim minim;
AudioPlayer player_wave;
AudioPlayer player;
int last_pos = 0;
float offset = 0;
int last_sec = 0;
Table table;

float[][] audio_bufs = new float[BUF_WIDTH][NUM_WAVES];

void setup()
{
  size(800, 600, P3D);
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


  background(0);
  stroke(255);
  

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
    color c = color(14+86*h, 100, 100*pow((baseline-100)/(float)(height), 0.5f));
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
  player.cue(pos + 10000 * 60);
  player_wave.cue(pos + 10000 * 60 + advance);
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

