module qbCylinder(r=1, h=1, a = 360) {
  a = (a > 360) ? 360 : ((a < 0) ? 0 : a);

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
