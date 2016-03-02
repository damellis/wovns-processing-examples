// Divan Quality, Landscape 1 Palette
// This draws a cross-hatch pattern, i.e. a grid of cells, each of which contains
// multiple lines. The lines in each cell alternate between horizontal and vertical.

size(2400, 6372); // 13.5" x 36", 177 DPI

noSmooth();
background(#050406); // Black Satin
stroke(#C2C2BF); // Pearl
strokeWeight(10); // draw lines 10 pixels thick

// the number of stripes to draw in each cell of the grid
int NUM_STRIPES = 5;

// the width and height of each cell of the grid
float w = width / 18.0, h = height / 48.0;

// the distance between stripes
float w2 = w / NUM_STRIPES, h2 = h / NUM_STRIPES;

for (int col = 0; col < 18; col++) {
  for (int row = 0; row < 48; row++) {
    for (int i = 0; i < NUM_STRIPES; i++) {
      // this will be true for every other cell in the grid
      if ((row + col) % 2 == 0) {
        // horizontal lines
        line(w * col + w2 / 2,       h * row + i * h2 + h2 / 2,
             w * (col + 1) - w2 / 2, h * row + i * h2 + h2 / 2);
      } else {
        // vertical lines
        line(w * col + i * w2 + w2 / 2, h * row + h2 / 2,
             w * col + i * w2 + w2 / 2, h * (row + 1) - h2 / 2);
      }
    }
  }
}

save("hatch.png");