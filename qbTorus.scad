/**
 * Torus (or slice of it).
 *
 * <openscad id="summary-example" caption="Sample tori">
 * use <main.scad>
 *
 * qbTorus(r1=2, r2=4);
 * translate([-7, -7, 0]) qbTorus(r1=1, r2=2, a=270);
 * translate([7, -2, 0]) qbTorus(r1=1, r2=2, a=60, $fn=16);
 * </openscad>
 *
 * This module can only generate non-intersecting tori. So `r1` has to be
 * strictly smaller than `r2`.
 *
 * @param r1 Radius of the tube.
 * @param r2 Distance from the center of the tube to the center of the torus.
 * @param a If less than 360, only the torus slice from `0` up to `a` degrees
 *     is generated.
 */
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
