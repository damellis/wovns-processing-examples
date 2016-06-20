// Generates a pattern using a grid, where each cell of the grid
// is filled in with a randomly-chosen shape. Based on a design by
// Bonny Guo. We're using the Talma quality, Spectrum 12 colors.

size(3984, 3000); // 46.5" x 36", 84 DPI
background(#020100); // Textured
noSmooth();
stroke(#A53643); // Cranberry
strokeWeight(15);
noFill();

int s = 84;

for (int y=0; y<height; y+=s) {
  for (int x=0; x<width; x+=s) {
    int n=int(random(9));
    if (n==1) {
      ellipse(x+0.5*s, y+0.5*s, s, s);
    } else if (n==2) {
      line(x,       y+0.5*s, x+0.5*s, y+0.5*s); 
      line(x+0.5*s, y+0.5*s, x+0.5*s, y);
    } else if (n==3) {
      line(x+s,     y+0.5*s, x+0.5*s, y+0.5*s);
      line(x+0.5*s, y+0.5*s, x+0.5*s, y+s);
    } else if (n==4) {
      line(x,       y+0.5*s, x+0.5*s, y+s);
      line(x+0.5*s, y+s,     x+s,     y+0.5*s);
    } else if (n==5) {
      line(x+0.5*s, y, x+s, y+0.5*s);
      line(x+0.5*s, y, x,   y+0.5*s);
    } else if (n==6) {
      line(x+0.5*s, y+0.5*s, x+s,     y+0.5*s);
      line(x+0.5*s, y+0.5*s, x+0.5*s, y);
    } else if (n==7) {
      line(x+0.5*s, y+0.5*s, x,       y+0.5*s);
      line(x+0.5*s, y+0.5*s, x+0.5*s, y+s);
    }
  }
}

save("random.png");