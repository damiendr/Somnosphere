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

Minim minim;
AudioSample sample;

void setup()
{
  size(512, 200, P3D);
  minim = new Minim(this);

  // load SD.wav from the data folder
  //snare = minim.loadSample("SD.wav", 512);
  sample = minim.loadSample("../../../data/loris_one_hour_modulated_both.aiff", 512);
  if ( sample == null ) println("Didn't get sample!");
  sample.trigger();
}

void draw()
{
  background(0);
  stroke(255);
  return;
  /*
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < sample.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, sample.bufferSize(), 0, width);
    float x2 = map(i+1, 0, sample.bufferSize(), 0, width);
    line(x1, 50 - sample.mix.get(i)*50, x2, 50 - sample.mix.get(i+1)*50);
    line(x1, 150 - sample.mix.get(i)*50, x2, 150 - sample.mix.get(i+1)*50);
  }
  */
}

