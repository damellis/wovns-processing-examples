// Talma Quality, Eden 17 Palette

size(3984, 3000);
background(#DAE5F2);
noSmooth();
noStroke();

int ystart = 0, xstart = 0; // the the value of x and y at the start of each row
int h = 84; // the height of the row

while (ystart < 3500) {
  int x = xstart, y = ystart; // start the row at (xstart, ystart)
  
  while (x < width) {
    fill(#F9FAFC);
    quad(x, y, x + 31, y - 21, x + 84, y - 11, x + 53, y + 10);
    
    fill(#BCD8F3);
    quad(x, y, x + 53, y + 10, x + 53, y + 10 + h, x, y + h);
    
    x += 84; // advance to the next column
    y -= 11; // shift the next column upward slightly
  }
  
  xstart -= 31; // shift the next row over
  ystart += h + 21; // advance to the next row
  h *= 1.1; // make the next row 10% higher
}

save("cubes.png");
