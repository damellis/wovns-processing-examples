// Divan Quality, Spectrum 19 Palette

// the size of the generated image (should match the WOVNS quality)
int WIDTH = 2400, HEIGHT = 6372;

// how many repeats of the generated image to show on-screen
int X_REPEATS = 4; // match the number of horizontal repeats in the Divan quality
int Y_REPEATS = 2; // show two yards vertically

// scale down the on-screen display by this much
int SCALE = 18;

color backgroundColor = #050505; // Petrol

// Draw one division of one repeat.
void drawOne(PGraphics graphics)
{
  graphics.strokeWeight(177);
  graphics.stroke(#B83D4E); // Geranium
  graphics.line(0, 0, 2400, 6372);
  graphics.line(2400, 0, 0, 6372);
}

void settings()
{
  size(WIDTH / SCALE * X_REPEATS, HEIGHT / SCALE * Y_REPEATS);
}

void setup()
{ 
  PGraphics pg = createGraphics(WIDTH, HEIGHT);

  noSmooth(); pg.noSmooth();

  pg.beginDraw();
  
  background(backgroundColor); pg.background(backgroundColor); 
  
  // draw to the saved image
  drawOne(pg);

  stroke(#FFFFFF);  
  line(width / X_REPEATS, 0, width / X_REPEATS, height / Y_REPEATS);
  line(0, height / Y_REPEATS, width / X_REPEATS, height / Y_REPEATS);

  for (int i = 0; i < X_REPEATS; i++) {
    for (int j = 0; j < Y_REPEATS; j++) {
      pushMatrix(); // save coordinate system
      
      // translate to the current repeat
      translate(i * width / X_REPEATS, j * height / Y_REPEATS);                    
      clip(0, 0, width / X_REPEATS + 1, height / Y_REPEATS + 1);
      scale(1.0 / SCALE, 1.0 / SCALE);
  
      // draw to the screen
      drawOne(g);
          
      popMatrix(); // restore coordinate system
    }
  }
  
  pg.endDraw();
  pg.save("repeat.png");
}