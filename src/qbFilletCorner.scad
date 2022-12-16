use <functions.scad>
use <qbSphere.scad>

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
 * @param bottomFrontR Fillet radius for bottom front edge. If undefined, use `r`.
 * @param bottomLeftR Fillet radius for bottom left edge. If undefined, use `r`.
 * @param frontLeftR Fillet radius for front left edge. If undefined, use `r`.
 * @param overshootLeft Extra width to the left.
 * @param overshootFront Extra depth to the front.
 * @param overshootBottom Extra height below `0`.
 */
module qbFilletCorner(r=1, bottomFrontR=undef, bottomLeftR=undef, frontLeftR, overshootLeft=1, overshootFront=1, overshootBottom=1) {
  bfr = firstDef(bottomFrontR, r);
  blr = firstDef(bottomLeftR, r);
  flr = firstDef(frontLeftR, r);

  erx = min(blr, flr);
  ery = min(bfr, flr);
  erz = min(bfr, blr);

  difference() {
    translate([-overshootLeft, -overshootFront, -overshootBottom]) cube([overshootLeft + erx, overshootFront + ery, overshootBottom + erz]);
    translate([erx, ery, erz]) qbSphere(rX=erx, rY=ery, rZ=erz);
  }
}


// ----------------------------------------
// Demo

module testPlain() {
  rotate([0, 0, 270]) qbFilletCorner(r=6);
}

module testBottomFrontR() {
  rotate([0, 0, 270]) qbFilletCorner(r=4, bottomFrontR=2);
}

module testBottomLeftR() {
  rotate([0, 0, 270]) qbFilletCorner(r=4, bottomLeftR=2);
}

module testFrontLeftR() {
  rotate([0, 0, 270]) qbFilletCorner(r=4, frontLeftR=2);
}

module testOvershootLeft() {
  rotate([0, 0, 270]) qbFilletCorner(r=4, overshootLeft=5);
}

module testOvershootFront() {
  rotate([0, 0, 270]) qbFilletCorner(r=4, overshootFront=5);
}

module testOvershootBottom() {
  rotate([0, 0, 270]) qbFilletCorner(r=4, overshootBottom=5);
}

module testFn() {
  rotate([0, 0, 270]) qbFilletCorner($fn=20);
}
