// Generates a pattern using a grid, where each cell of the grid
// is filled in with a randomly-chosen shape. Based on a design by
// Bonny Guo. We're using the Talma quality, Spectrum 12 colors.

size(3984, 3000); // set the width and height of the canvas, in pixels (for the "Talma" quality)
background(#020100); // set the background color (to "Textured")
noSmooth(); // turn off anti-aliasing, which creates problems for weaving
stroke(#A53643); // set the color of the stroke for future drawn shapes (to "Cranberry")
strokeWeight(15); // set the weight (width) of the stroke for future drawn shapes
noFill(); // disable filling of future drawn shapes

int m = 84; // this is the size of our grid, approximately one inch 

// Loop through each cell of the grid, starting at the upper-left hand corner of the canvas.
// (That's how computer coordinates work.) See: https://processing.org/tutorials/drawing/
// for more information.
for (int y=0; y<height; y+=m) { // this sets y to 0, 84, 168, etc, up to the height of the canvas
  for (int x=0; x<width; x+=m) { // this sets x to 0, 84, 168, etc, up to the width of the canvas
    // For each cell in the grid, we draw a random shape / design.
    int j=int(random(9)); // pick a number from 0 to 9 (exclusive), i.e. 0, 1, 2, 3, 4, 5, 6, 7 or 8
    if (j==1) { // if we picked 1, draw a circle (an ellipse with equal width and height)
      // The ellipse() command has four parameters: x, y, width, and height.
      // x and y refer to the center of the ellipse. We set them equal to the center of our
      // grid cell, i.e. we add half of the cell size (0.5 * m) to the x and y coordinates
      // of the corner of the cell. The width and height of the ellipse are both equal to
      // the size of the grid cell (m).
      ellipse(x+0.5*m, y+0.5*m, m, m);
    } else if (j==2) {
      // Draw two perpendicular lines, one vertical and one horizontal.
      // The line command takes four arguments, x1, y1, x2, and y2.
      // These specify the x and y locations of the start and end of the line.
      line(x, y+0.5*m, x+0.5*m, y+0.5*m); // from half-way down the left edge of the cell to its center 
      line( x+0.5*m, y+0.5*m, x+0.5*m, y); // from the cell's center to half-way along its top edge
    } else if (j==3) {
      line(x+m, y+0.5*m, x+0.5*m, y+0.5*m); // from half-way down the right edge of the cell to its center
      line(x+0.5*m, y+0.5*m, x+0.5*m, y+m); // from the cell's center to half-way along its bottom edge
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

// Save the resulting image. Select "Show Sketch Folder" from the "Sketch" menu to locate it.
save("random.png");