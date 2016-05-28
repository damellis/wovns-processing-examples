// Talma, Spectrum 7 Colors
size(3984, 3000);
background(#487A9C); // Teal
noSmooth();
stroke(#E1C779); // Pollen 
strokeWeight(20);
noFill();

int m=84; 

for (int y=0; y<height; y+=m) {
  for (int x=0; x<width; x+=m) {
    int j=int(random(5));
    if (j==1) {
      line(x, y, x+m, y+m);
      line(x, y+m, x+m, y);
    } else if (j==2) {
      line(x, y, x+m, y+m);
    } else if (j==3) {
      line(x, y+m, x+m, y);
    } else if (j==4) {
    }
  }
}

save("random.png");