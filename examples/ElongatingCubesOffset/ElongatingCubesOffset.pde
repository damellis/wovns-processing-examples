// Talma Quality, Eden 17 Palette

size(3984, 3000);
background(#DAE5F2);
noSmooth();
noStroke();

int ystart = -500, xstart = 0; // the the value of x and y at the start of each row
int h = 84; // the height of the row

while (ystart < 3500) {
  int x = xstart, y = ystart; // start the row at (xstart, ystart)
  int col = 0; // for keeping track of which column we're on
  
  while (x < width) {
    fill(#F9FAFC);
    quad(x, y, x + 31, y - 21, x + 84, y - 11, x + 53, y + 10);
    
    fill(#BCD8F3);
    quad(x, y, x + 53, y + 10, x + 53, y + 10 + h, x, y + h);
    
    // Every fourth column, shift the pattern over. We do this by
    // checking if "col" is evenly divisible by four using the modulo
    // operator (%). Here, "col % 4" means the remainder when col is
    // divided by four. If the remainder is zero, col is evenly
    // divisible by four, which happens every four columns (when
    // col = 0, 4, 8, etc).
    if (col % 4 == 0) {
      x -= 31;
      y += 84;
    }
    
    x += 84; // advance to the next column
    y -= 11; // shift the next column upward slightly
    col++;
  }
  
  xstart -= 31; // shift the next row over
  ystart += h + 21; // advance to the next row
  h *= 1.1; // make the next row 10% higher
}

save("cubes.png");
