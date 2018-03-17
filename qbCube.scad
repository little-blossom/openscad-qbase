use <functions.scad>
use <qbFilletRect.scad>

module qbCube(size=[10, 10, 10],
  filletFrontLeftR=undef, filletFrontRightR=undef, filletBackLeftR=undef, filletBackRightR=undef,
  filletBottomLeftR=undef, filletBottomRightR=undef, filletTopLeftR=undef, filletTopRightR=undef,
  filletBottomFrontR=undef, filletTopFrontR=undef, filletBottomBackR=undef, filletTopBackR=undef,
  filletR=undef) {

  difference() {
    cube(size);

    qbFilletRect(size=size, frontLeftR=filletFrontLeftR, frontRightR=filletFrontRightR, backLeftR=filletBackLeftR, backRightR=filletBackRightR, r=filletR);

    translate([0, size[1], 0])
      rotate(a=[90, 0, 0])
      qbFilletRect(size=[size[0], size[2], size[1]], frontLeftR=filletBottomLeftR, frontRightR=filletBottomRightR, backLeftR=filletTopLeftR, backRightR=filletTopRightR, r=filletR);

    translate([size[0], 0, 0])
      rotate(a=[0, -90, 0])
      qbFilletRect(size=[size[2], size[1], size[0]], frontLeftR=filletBottomFrontR, frontRightR=filletTopFrontR, backLeftR=filletBottomBackR, backRightR=filletTopBackR, r=filletR);
  }
}


// ----------------------------------------
// Tests

module testPlain() {
  qbCube([5, 4, 3]);
}

module testFilletFrontLeft() {
  qbCube([7, 6, 5], filletFrontLeftR=2);
}

module testFilletFrontRight() {
  qbCube([7, 6, 5], filletFrontRightR=2);
}

module testFilletBackLeft() {
  qbCube([7, 6, 5], filletBackLeftR=2);
}

module testFilletBackRight() {
  qbCube([7, 6, 5], filletBackRightR=2);
}

module testFilletBottomLeft() {
  qbCube([7, 6, 5], filletBottomLeftR=2);
}

module testFilletBottomRight() {
  qbCube([7, 6, 5], filletBottomRightR=2);
}

module testFilletTopLeft() {
  qbCube([7, 6, 5], filletTopLeftR=2);
}

module testFilletTopRight() {
  qbCube([7, 6, 5], filletTopRightR=2);
}

module testFilletBottomFront() {
  qbCube([7, 6, 5], filletBottomFrontR=2);
}

module testFilletTopFront() {
  qbCube([7, 6, 5], filletTopFrontR=2);
}

module testFilletBottomBack() {
  qbCube([7, 6, 5], filletBottomBackR=2);
}

module testFilletTopBack() {
  qbCube([7, 6, 5], filletTopBackR=2);
}

module testFilletR() {
  $fn=12;
  qbCube([7, 6, 5], filletR=1);
}
