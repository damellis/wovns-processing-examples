// Divan Spectrum 2
import processing.svg.*;

size(500, 500);
beginRecord(SVG, "output.svg");
noStroke();
noSmooth();
fill(#DA9AAD); // Sedona
ellipse(width / 2, height / 2, width, height);
fill(#4688B5); // Cyan
ellipse(width / 2, height / 2, width / 2, height / 2);
endRecord();
exit();