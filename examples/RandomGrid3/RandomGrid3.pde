// Talma, Pastel 11 Colors
size(3984, 3000);
background(#74AED7); // Ciel
noSmooth();
strokeWeight(20);
noFill();

color c1 = #FFE4F3; // Pinking
color c2 = #FEE597; // Yolk 
int m=84;

for (int y=0; y<height; y+=m) {
  for (int x=0; x<width; x+=m) {
    int j=int(random(6));
    if (j==1) {
      stroke(c1);
      point(x, y);
    } else if (j==2) {
      stroke(c1);
      point(x + 42, y + 42);
      stroke(c2);
      point(x + 21, y + 21);
    } else if (j==3) {
      stroke(c1);
      point(x, y);
      point(x + 21, y + 21);
      stroke(c2);
      point(x + 42, y + 42);
    } else if (j==4) {
      stroke(c1);
      point(x, y);
      point(x + 21, y + 21);
      point(x + 42, y + 42);
      stroke(c2);
      point(x + 63, y + 63);
    }
  }
}

save("random.png");