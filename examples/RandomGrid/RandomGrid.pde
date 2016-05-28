// Generates a pattern using a grid, where each cell of the grid
// is filled in with a randomly-chosen shape. Based on a design by
// Bonny Guo. We're using the Talma quality, Spectrum 12 colors.

size(3984, 3000);
background(#020100);
noSmooth();
stroke(#A53643);
strokeWeight(15);
noFill();

int m = 84; 

for (int y=0; y<height; y+=m) {
  for (int x=0; x<width; x+=m) {
    int j=int(random(9));
    if (j==1) {
      ellipse(x+0.5*m, y+0.5*m, m, m);
    } else if (j==2) {
      line(x, y+0.5*m, x+0.5*m, y+0.5*m); 
      line( x+0.5*m, y+0.5*m, x+0.5*m, y);
    } else if (j==3) {
      line(x+m, y+0.5*m, x+0.5*m, y+0.5*m);
      line(x+0.5*m, y+0.5*m, x+0.5*m, y+m);
    } else if (j==4) {
      line(x, y+0.5*m, x+0.5*m, y+m);
      line(x+0.5*m, y+m, x+m, y+0.5*m);
    } else if (j==5) {
      line(x+0.5*m, y, x+m, y+0.5*m);
      line(x+0.5*m, y, x, y+0.5*m);
    } else if (j==6) {
      line(x+0.5*m, y+0.5*m, x+m, y+0.5*m);
      line(x+0.5*m, y+0.5*m, x+0.5*m, y);
    } else if (j==7) {
      line(x+0.5*m, y+0.5*m, x, y+0.5*m);
      line(x+0.5*m, y+0.5*m, x+0.5*m, y+m);
    }
  }
}

save("random.png");