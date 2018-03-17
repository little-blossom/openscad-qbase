use <qbCylinder.scad>

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
