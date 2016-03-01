// Divan Quality, Landscape 1 Palette
size(2400, 6372); // 13.5" x 36", 177 DPI

noSmooth();
background(#050406); // Black Satin
stroke(#C2C2BF); // Pearl
strokeWeight(10); // draw lines 10 pixels thick

int NUM_STRIPES = 5;
float w = width / 18.0, w2 = w / NUM_STRIPES;
float h = height / 48.0, h2 = h / NUM_STRIPES;
for (int col = 0; col < 18; col++) {
  for (int row = 0; row < 48; row++) {
    for (int i = 0; i < NUM_STRIPES; i++) {
      if ((row + col) % 2 == 0) {
        line(w * col + w2 / 2,       h * row + i * h2 + h2 / 2,
             w * (col + 1) - w2 / 2, h * row + i * h2 + h2 / 2);
      } else {
        line(w * col + i * w2 + w2 / 2, h * row + h2 / 2,
             w * col + i * w2 + w2 / 2, h * (row + 1) - h2 / 2);
      }
    }
  }
}

save("hatch.png");
