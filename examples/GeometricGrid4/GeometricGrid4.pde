// Divan Quality, Pastel 2 Palette
size(2400, 6372); // 13.5" x 36", 177 DPI

background(#6984B8); // Buscabulla
noSmooth();
noStroke();

int w = width / 18;
int h = height / 48;
color colors[] = { #D1D2EA, #BFCDE5, #ABC1E5, #EEC3C3, #FFE4F3, #FFEEF8 };
for (int col = 0; col < 18; col++) {
  for (int row = 0; row < 48; row++) {
    fill(colors[row % colors.length]);
    rect(w * col + w / 8, h * row + h / 8, w * 3 / 4, h * 3 / 4);
  }
}

save("grid.png");
