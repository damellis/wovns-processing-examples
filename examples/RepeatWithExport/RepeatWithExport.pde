// Divan Quality, Spectrum 19 Palette

// how many copies of the final design file to show on the screen
int X_REPEATS = 4;
int Y_REPEATS = 2;

// how many times to sub-divide the final design file
int X_DIVIDE = 2;
int Y_DIVIDE = 3;

int SCALE = 18;

PGraphics pg;

void settings()
{
  size(2400 / SCALE * X_REPEATS, 6372 / SCALE * Y_REPEATS);
}

void setup()
{ 
  pg = createGraphics(2400, 6372);

  noSmooth(); pg.noSmooth();

  pg.beginDraw();
  
  // account for the difference in resolution between the screen and the saved image
  pg.scale(SCALE, SCALE);  
}

// Draw one division of one repeat.
void drawTo(PGraphics graphics)
{
  graphics.noStroke();
  graphics.fill(#B83D4E); // Geranium  
  graphics.ellipse(20, 20, 5, 5);
  graphics.ellipse(60, 110, 50, 50);
}

void draw()
{
  background(#050505); pg.background(#050505); // Petrol 
  
  for (int divideX = 0; divideX < X_DIVIDE; divideX++) {
    for (int divideY = 0; divideY < Y_DIVIDE; divideY++) {
      pg.pushMatrix();
      
      pg.translate(pg.width / X_DIVIDE * divideX / SCALE, pg.height / Y_DIVIDE * divideY / SCALE);
      
      pg.clip(0, 0, pg.width / X_DIVIDE / SCALE + 1, pg.height / Y_DIVIDE / SCALE + 1);

      // draw to the saved image
      drawTo(pg);
      
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
          
          // draw to the screen
          drawTo(g);
          
          popMatrix();
        }
      }
          
      popMatrix(); // restore coordinate system
    }
  }
}

void keyPressed()
{
  pg.endDraw();
  pg.save("repeat.png");
  exit();
}