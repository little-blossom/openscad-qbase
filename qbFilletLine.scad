/**
 * Solid to substract from an edge to get a fillet.
 *
 * @param r Radius of the desired fillet.
 * @param h Height of the edge to build the fillet for.
 */
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
