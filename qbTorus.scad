// r1 -- radius of extruded circle
// r2 -- radius of extrusion rotation
module qbTorus(r1=1, r2=2, a=360) {
  a = (a > 360) ? 360 : ((a < 0) ? 0 : a);

  if (a < 180) {
    difference() {
      qbTorus(r1=r1, r2=r2, a=180);
      rotate(a=[0, 0, a]) translate([-(r1+r2+1), 0, -r1-1]) cube([2*(r1+r2+1), (r1+r2+1), 2*(r1+1)]);
    }
  } else if (a == 180) {
      difference() {
        qbTorus(r1=r1, r2=r2);
        translate([-(r1+r2+1), -(r1+r2+1), -r1-1]) cube([2*(r1+r2+1), (r1+r2+1), 2*(r1+1)]);
      }
  } else if (a == 360) {
      rotate_extrude(convexity = 10) translate([r2, 0, 0]) circle(r = r1);
  } else {
    union() {
      qbTorus(r1=r1, r2=r2, a=180);
      rotate(a=[0, 0, 180]) qbTorus(r1=r1, r2=r2, a=a - 180);
    }
  }
}


// ----------------------------------------
// Tests

module testPlain() {
    qbTorus(r1 = 2, r2=4);
}

module testFn() {
    qbTorus(r1 = 2, r2=4, $fn=5);
}

module testLessThanHalf() {
    qbTorus(r1 = 3, r2=4, a=20);
}

module testHalf() {
    qbTorus(r1 = 3, r2=4, a=180);
}

module testMoreThanHalf() {
    qbTorus(r1 = 2, r2=3, a=235);
}

module testFull() {
    qbTorus(r1 = 3, r2=4, a=360);
}
