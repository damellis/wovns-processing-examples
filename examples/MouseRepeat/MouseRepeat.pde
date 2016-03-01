// Divan Quality, Spectrum 19 Palette

int X_REPEATS = 4;
int Y_REPEATS = 2;

void setup()
{
  size(533, 708); // 54" x 72" at 1/18th resolution 
  background(#050505); // Petrol 
  noSmooth();
  
  stroke(#FFFFFF);
  line(width / X_REPEATS, 0, width / X_REPEATS, height / Y_REPEATS);
  line(0, height / Y_REPEATS, width / X_REPEATS, height / Y_REPEATS);
  
  noStroke();
  fill(#B83D4E); // Geranium
}

void draw()
{
}

void mouseDragged()
{
  if (mouseX < width / X_REPEATS && mouseY < height / Y_REPEATS) {
    for (int i = 0; i < X_REPEATS; i++) {
      for (int j = 0; j < Y_REPEATS; j++) {
        ellipse(mouseX + i * width / X_REPEATS, mouseY + j * height / Y_REPEATS, 10, 10);
      }
    }
  }
}

