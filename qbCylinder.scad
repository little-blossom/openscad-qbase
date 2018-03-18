use <functions.scad>
use <qbFilletCircle.scad>

/**
 * Cylinder (or slice of it) with optional fillets.
 *
 * @param r Radius of the cylinder.
 * @param h Height of the cylinder.
 * @param a If less than 360, only the cylinder slice from `0` up to `a` degrees
 *     is generated.
 * @param filletTopR Radius of fillet for cylinder's top.
 * @param filletBottomR Radius of fillet for cylinder's bottom.
 * @param filletR Radius of fillets for the tob and bottom of the cylinder.
 */
module qbCylinder(r=1, h=1, a = 360, filletTopR=undef, filletBottomR=undef, filletR=undef) {
  a = (a > 360) ? 360 : ((a < 0) ? 0 : a);

  difference() {
    if (a < 180) {
      difference() {
        qbCylinder(r=r, h=h, a=180);
        rotate(a=[0, 0, a]) translate([-r-1, 0, -1]) cube([2*(r+1), (r+1), h+2]);
      }
    } else if (a == 180) {
      difference() {
        qbCylinder(r=r, h=h);
        translate([-r-1, -r-1, -1]) cube([2*(r+1), (r+1), h+2]);
      }
    } else if (a == 360) {
      cylinder(r=r, h=h);
    } else {
      union() {
        qbCylinder(r=r, h=h, a=180);
        rotate(a=[0, 0, 180]) qbCylinder(r=r, h=h, a=a - 180);
      }
    }

    rT = firstDef(filletTopR, filletR);
    if (rT != undef) {
      translate([0, 0, h]) qbFilletCircle(circleR=r, filletR=rT);
    }

    rB = firstDef(filletBottomR, filletR);
    if (rB != undef) {
      rotate(a=[180, 0, 0]) qbFilletCircle(circleR=r, filletR=rB);
    }
  }
}

// ----------------------------------------
// Tests

module testPlain() {
  qbCylinder(r=3, h=4);
}

module testFn() {
  qbCylinder(r=2, h=4, $fn=25);
}

module testLessThanHalf() {
  qbCylinder(r=3, h=4, a=20);
}

module testHalf() {
  qbCylinder(r=3, h=4, a=180);
}

module testMoreThanHalf() {
  qbCylinder(r=3, h=4, a=235);
}

module testFull() {
  qbCylinder(r=3, h=5, a=360);
}

module testFilletTopR() {
  qbCylinder(r=5, h=7, filletTopR=2);
}

module testFilletBottomR() {
  qbCylinder(r=5, h=7, filletBottomR=2);
}

module testFilletR() {
  qbCylinder(r=5, h=7, filletR=2);
}

module testFilletRShort() {
  qbCylinder(r=6, h=1, filletR=2.8);
}

module testFilletRAngle() {
  qbCylinder(r=5, h=7, filletR=2, a=270);
}
