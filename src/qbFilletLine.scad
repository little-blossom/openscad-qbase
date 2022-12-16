/**
 * Solid to substract from an edge to get a fillet.
 *
 * <openscad id="summary-example" caption="Sample edge fillets">
 * use <main.scad>
 *
 * rotate([0, 0, 270]) qbFilletLine(r=5, h=7);
 * </openscad>
 *
 * @param r Radius of the desired fillet.
 * @param h Height of the edge to build the fillet for.
 * @param overshootTop Extra height on top of `h`.
 * @param overshootBottom Extra height below `0`.
 */
module qbFilletLine(r=1, h=2, overshootTop=1, overshootBottom=1) {
  difference() {
    translate([-1, -1, -overshootBottom]) cube([r+1, r+1, h+overshootTop+overshootBottom]);
    translate([r, r, -overshootBottom - 1]) cylinder(r=r, h=h+overshootTop+overshootBottom+2);
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

module testOvershootTop() {
  qbFilletLine(r=3, h=4, overshootTop=3);
}

module testOvershootBottom() {
  qbFilletLine(r=3, h=4, overshootBottom=2);
}

module testOvershootAll() {
  qbFilletLine(r=3, h=4, overshootTop=3, overshootBottom=2);
}
