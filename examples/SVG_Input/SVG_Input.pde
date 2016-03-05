// Divan Quality, Spectrum 2 Palette

size(2400, 6372);
noSmooth();
background(#696774); // Reflector

// load an SVG from the data/ directory
PShape s = loadShape("circles.svg");

// draw 10 copies of the shape, with random sizes and locations
for (int i = 0; i < 10; i++) {
  float scale = random(0.5, 2.0); // scale factor, from half to double the original size
  
  // draw the shape at a random location, scaled according the random scale factor
  shape(s, random(width), random(height), s.width * scale, s.height * scale); 
}

save("random.png");