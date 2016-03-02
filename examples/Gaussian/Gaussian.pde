// Talma Quality, Spectrum 19 Palette
size(3984, 3000);

background(#8B8795); // Suva
noSmooth();
noStroke();

int w = 7, h = 7; // 1/12" x 1/12"

fill(#302D32); // Matte Black
for (int x = 0; x < width; x += w) {
  // threshold based on a gaussian function (bell curve) that gives
  // a number between 1 in the middle of the screen and 0 at the left
  // and right edges. the 8.0 adjusts the width of the bell, i.e.
  // how quickly the value drops to 0 as you move towards the edges of
  // the screen.
  float threshold = exp(-8.0 * sq((0.5 - (float(x) / width))));
  for (int y = 0; y < height; y += h) {
    // generate a random number between 0 and 1 and compare it to the
    // threshold. if it's less than the threshold, draw a small square.
    if (random(1) < threshold) rect(x, y, w, h); 
  }
}

save("gaussian.png");