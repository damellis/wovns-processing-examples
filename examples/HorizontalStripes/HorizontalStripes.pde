// Talma Quality, Spectrum 2 Palette

size(3984, 3000); // dimensions in pixels (corresponds to 46-48" x 36" at 84 DPI)
background(#D5C9D9); // draw the background (Pink Pearl)
noSmooth();
noStroke(); // don't draw outlines around shapes

// Draw stripes at y = 0, 500, 1000, 1500, 2000, and 2500.
// Note that we're using the special variable "height", which is the height
// of the canvas (3000 pixels as specified in the call to size() above).
for (int y = 0; y < height; y += 500) {
  // Draw the first stripe using the rect() function.
  // Note that we're using the special variable "width", the analogue of 
  // "height". Its value is 3984.
  fill(#B83D4E); // set the color of the first rectangle (Geranium)
  rect(0, y, width, 84); // corner at (0, y). full width, 84 pixels high.
  
  // Draw two shorter stripes.
  fill(#95577E); // Orchid
  rect(0, y + 84 + 21, width, 10); // start 21 pixels (1/4") below the first stripe
  fill(#A884A1); // Lilac
  rect(0, y + 84 + 42, width, 10); // start 42 pixels (1/2") below the first stripe
}

save("stripes.png"); // save the output to the same directory as this sketch
