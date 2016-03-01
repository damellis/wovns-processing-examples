// Talma Quality, Eden 20 Quality
size(3984, 3000); // 46-48" x 36", 84 DPI

background(#FEFFF3); // Pale
noSmooth();
strokeWeight(16); // draw lines 16 pixels thick
noFill();

color colors[] = { #C9E0F6, #BAE1D5, #C9E0F6, #BAE1D5, #C9E0F6, #BAE1D5 };

for (int row = 0; row < 20; row++) {
  for (int i = 0; i < colors.length; i++) {
    stroke(colors[i]);
    int x = -i * 20, y = row * 500 - i * 20;
    beginShape();
    while (x < width) {
      vertex(x, y); x += 600; y += 130;
      vertex(x, y); x += 130; y -= 200;
      vertex(x, y);
    }
    endShape();
  }
}

save("wave.png");
