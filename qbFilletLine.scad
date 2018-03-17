// qbFilletLine
// rail to subtract from edges to get fillets.
//
// r - radius for the fillet
// h - height of the edge to build the fillet rail for. The actual
//     rail will be higher to avoid face-on-face issues.
//
module qbFilletLine(r, h) {
  difference() {
    translate([-1, -1, -1]) cube([r+1, r+1, h+2]);
    translate([r, r, -2]) cylinder(r=r, h=h+4);
  }
}


// ----------------------------------------
// Demo

module testPlain() {
  qbFilletLine(r=2, h=2);
}

module testFn() {
  qbFilletLine(r=3, h=4, $fn=20);
}
