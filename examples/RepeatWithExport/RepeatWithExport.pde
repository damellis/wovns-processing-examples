// Divan Quality, Spectrum 19 Palette

// the size of the generated image (should match the WOVNS quality)
int WIDTH = 2400, HEIGHT = 6372;

// how many repeats of the generated image to show on-screen
int X_REPEATS = 4; // match the number of horizontal repeats in the Divan quality
int Y_REPEATS = 2; // show two yards vertically

// how many times to sub-divide the generate image
int X_DIVIDE = 2;
int Y_DIVIDE = 3;

// scale down the on-screen display by this much
int SCALE = 18;

color backgroundColor = #050505; // Petrol

// Draw one division of one repeat.
void drawOne(PGraphics graphics)
{
  graphics.strokeWeight(177);
  graphics.stroke(#B83D4E); // Geranium
  graphics.line(0, 0, 1200, 2124);
  graphics.line(1200, 0, 0, 2124);
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
  
  for (int divideX = 0; divideX < X_DIVIDE; divideX++) {
    for (int divideY = 0; divideY < Y_DIVIDE; divideY++) {
      pg.pushMatrix();
      
      pg.translate(pg.width / X_DIVIDE * divideX, pg.height / Y_DIVIDE * divideY);
      
      pg.clip(0, 0, pg.width / X_DIVIDE + 1, pg.height / Y_DIVIDE + 1);

      // draw to the saved image
      drawOne(pg);
      
      pg.popMatrix();
    }
  }

  stroke(#FFFFFF);  
  for (int i = 1; i <= X_DIVIDE; i++) {
    for (int j = 1; j <= Y_DIVIDE; j++) { 
      line(width / X_REPEATS / X_DIVIDE * i, 0,
           width / X_REPEATS / X_DIVIDE * i, height / Y_REPEATS);
      line(0, height / Y_REPEATS / Y_DIVIDE * j,
           width / X_REPEATS, height / Y_REPEATS / Y_DIVIDE * j);
    }
  }
  

  for (int i = 0; i < X_REPEATS; i++) {
    for (int j = 0; j < Y_REPEATS; j++) {
      pushMatrix(); // save coordinate system
      
      // translate to the current repeat
      translate(i * width / X_REPEATS, j * height / Y_REPEATS);
          
      for (int divideX = 0; divideX < X_DIVIDE; divideX++) {
        for (int divideY = 0; divideY < Y_DIVIDE; divideY++) {
          pushMatrix();
          
          translate(width / X_REPEATS / X_DIVIDE * divideX,
                    height / Y_REPEATS / Y_DIVIDE * divideY);
                    
          clip(0, 0, width / X_REPEATS / X_DIVIDE + 1, height / Y_REPEATS / Y_DIVIDE + 1);
          
          scale(1.0 / SCALE, 1.0 / SCALE);

          // draw to the screen
          drawOne(g);
          
          popMatrix();
        }
      }
          
      popMatrix(); // restore coordinate system
    }
  }
  
  pg.endDraw();
  pg.save("repeat.png");
}