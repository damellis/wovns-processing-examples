// Divan Quality, Spectrum 19 Palette

int WIDTH = 2400, HEIGHT = 6372;

// how many copies of the final design file to show on the screen
int X_REPEATS = 4;
int Y_REPEATS = 2;

// how many times to sub-divide the final design file
int X_DIVIDE = 2;
int Y_DIVIDE = 3;

int SCALE = 18;

color backgroundColor = #050505; // Petrol

// Draw one division of one repeat.
void drawOne(PGraphics graphics)
{
  graphics.noStroke();
  graphics.fill(#B83D4E); // Geranium  
  graphics.ellipse(200, 200, 200, 200);
  graphics.ellipse(1000, 200, 200, 200);
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