use <functions.scad>
use <qbCube.scad>
use <qbTorus.scad>

// qbFilletCircle
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
