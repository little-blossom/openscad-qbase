use <functions.scad>
use <qbCube.scad>
use <qbTorus.scad>

/**
 * Solid to substract from cylinder to get fillets.
 *
 * <openscad id="summary-example" caption="Sample circle fillets">
 * use <main.scad>
 *
 * rotate([180, 0, 0]) qbFilletCircle(circleR=5, filletR=2);
 * </openscad>
 *
 * @param circleR Radius of the cylinder.
 * @param filletR Radius of the desired fillet.
 */
module qbFilletCircle(circleR=3, filletR=1) {
  translate([0, 0, -filletR])
    difference() {
      translate([-(circleR+1), -(circleR+1), 0])
         qbCube([2*(circleR+1), 2*(circleR+1), filletR+1]);
      translate([0, 0, -1])
        cylinder(r=circleR-filletR, h=filletR+1);
      qbTorus(r1=filletR, r2=circleR-filletR);
    }
}


// ----------------------------------------
// Demo

module testPlain() {
  rotate([180, 0, 0]) qbFilletCircle(circleR = 12, filletR=6);
}
