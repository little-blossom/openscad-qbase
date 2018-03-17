use <functions.scad>
use <qbFilletLine.scad>

// qbFilletRect
module qbFilletRect(size=[10, 10, 10], frontLeftR=undef, frontRightR=undef, backLeftR=undef, backRightR=undef, r=undef) {
    union() {
        rFL = firstDef(frontLeftR, r);
        if (rFL != undef) {
            qbFilletLine(r=rFL, h=size[2]);
        }

        rFR = firstDef(frontRightR, r);
        if (rFR != undef) {
            translate([size[0], 0, 0]) rotate(a=[0, 0, 90]) qbFilletLine(r=rFR, h=size[2]);
        }

        rBL = firstDef(backLeftR, r);
        if (rBL != undef) {
            translate([0, size[1], 0]) rotate(a=[0, 0, 270]) qbFilletLine(r=rBL, h=size[2]);
        }

        rBR = firstDef(backRightR, r);
        if (rBR != undef) {
            translate([size[0], size[1], 0]) rotate(a=[0, 0, 180]) qbFilletLine(r=rBR, h=size[2]);
        }
  }
}


// ----------------------------------------
// Demo

module testFrontLeft() {
  qbFilletRect([5, 5, 6], frontLeftR=2);
}

module testFrontRight() {
  qbFilletRect([7, 6, 5], frontRightR=2);
}

module testBackLeft() {
  qbFilletRect([7, 6, 5], backLeftR=2);
}

module testBackRight() {
  qbFilletRect([7, 6, 5], backRightR=2);
}

module testR() {
  $fn=30;
  qbFilletRect([7, 6, 5], r=2);
}
