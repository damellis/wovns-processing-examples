// Talma Quality, Spectrum 19 Palette
size(3984, 3000);

background(#8B8795); // Suva
noSmooth();
noStroke();

int w = 7, h = 7; // 1/12" x 1/12"

fill(#302D32); // Matte Black
for (int x = 0; x < width; x += w) {
  float threshold = exp(-8.0 * sq((0.5 - (float(x) / width))));
  for (int y = 0; y < height; y += h) {
    if (random(1) < threshold) rect(x, y, w, h); 
  }
}

save("gaussian.png");
