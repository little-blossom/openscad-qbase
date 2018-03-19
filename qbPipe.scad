use <qbCylinder.scad>

/**
 * Pipe (or slice of it).
 *
 * <openscad id="summary-example" caption="Sample tori">
 * use <main.scad>
 *
 * qbPipe(r1=5, r2=3, h=7);
 * translate([-6, -10, 0])
 *   qbPipe(r1=4, r2=3, h=4, a=100);
 * translate([10, -2, 0])
 *   qbPipe(r1=3, r2=1, h=1, a=270, $fn=16);
 * </openscad>
 *
 * @param r1 Outer radius of the pipe.
 * @param r2 Inner radius of the pipe.
 * @param h Height of the pipe.
 * @param a If less than 360, only the slice from `0` up to `a` degrees
 *     is generated.
 */
module qbPipe(r1=2, r2=1, h=1, a=360) {
    difference() {
        qbCylinder(r=r1, h=h, a=a);
        translate([0, 0, -1]) rotate([0, 0, -1]) qbCylinder(r=r2, h=h+2, a=a+2);
    }
}

// ----------------------------------------
// Tests

module testPlain() {
  qbPipe(r1=5, r2=2, h=3);
}

module testR1() {
  qbPipe(r1=6, r2=2, h=3);
}

module testR2() {
  qbPipe(r1=5, r2=3, h=3);
}

module testH() {
  qbPipe(r1=5, r2=2, h=4);
}

module testFn() {
  qbPipe(r1=5, r2=2, h=3, $fn=30);
}

module testLessThanHalf() {
  qbPipe(r1=5, r2=2, h=3, a=20);
}

module testMoreThanHalf() {
  qbPipe(r1=5, r2=2, h=3, a=235);
}
