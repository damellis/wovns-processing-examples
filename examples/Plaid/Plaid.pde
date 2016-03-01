// Talma Quality, Landscape 18 Palette

size(3984, 3000); // 46-48" x 36" at 84 DPI
background(#000500); // Black Feather
noSmooth();
noStroke();

// Draw vertical stripes every three inches.
fill(#0D644C); // Malachite
for (int x = 0; x < width; x += 84 * 3) {
  rect(x, 0, 84, height); // one inch wide, full-height stripes
}

// Draw stripes every three inches along the height. 
fill(#B9B34B); // Black & Gold
for (int y = 0; y < height; y += 84 * 3) {
  // For each value of y, draw five stripes, at:
  // y, y + 21, y + 42, y + 63, and y + 84.
  for (int i = 0; i < 5; i++) {
    rect(0, y + i * 21, width, 10);
  }
}

// Combine the two loops above to draw a different color where
// the horizontal and vertical stripes intersect.
fill(#6A8E51); // Peridot
for (int x = 0; x < width; x += 84 * 3) {
  for (int y = 0; y < height; y += 84 * 3) {
    for (int i = 0; i < 5; i++) {
      rect(x, y + i * 21, 84, 10);
    }
  }
}

save("plaid.png");
