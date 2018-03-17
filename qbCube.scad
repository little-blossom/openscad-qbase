use <functions.scad>
use <qbFilletRect.scad>

module qbCube(size=[10, 10, 10],
  filletFrontLeftR=undef, filletFrontRightR=undef, filletBackLeftR=undef, filletBackRightR=undef,
  filletBottomLeftR=undef, filletBottomRightR=undef, filletTopLeftR=undef, filletTopRightR=undef,
  filletBottomFrontR=undef, filletTopFrontR=undef, filletBottomBackR=undef, filletTopBackR=undef,
  filletFrontR=undef, filletBackR=undef, filletLeftR=undef, filletRightR=undef,
  filletTopR=undef, filletBottomR=undef, filletR=undef) {

  difference() {
    cube(size);

    qbFilletRect(
      size=size,
      frontLeftR=firstDef(filletFrontLeftR, filletFrontR, filletLeftR),
      frontRightR=firstDef(filletFrontRightR, filletFrontR, filletRightR),
      backLeftR=firstDef(filletBackLeftR, filletBackR, filletLeftR),
      backRightR=firstDef(filletBackRightR, filletBackR, filletRightR),
      r=filletR);

    translate([0, size[1], 0])
      rotate(a=[90, 0, 0])
      qbFilletRect(
        size=[size[0], size[2], size[1]],
        frontLeftR=firstDef(filletBottomLeftR, filletLeftR, filletBottomR),
        frontRightR=firstDef(filletBottomRightR, filletRightR, filletBottomR),
        backLeftR=firstDef(filletTopLeftR, filletLeftR, filletTopR),
        backRightR=firstDef(filletTopRightR, filletRightR, filletTopR),
        r=filletR);

    translate([size[0], 0, 0])
      rotate(a=[0, -90, 0])
      qbFilletRect(
        size=[size[2], size[1], size[0]],
        frontLeftR=firstDef(filletBottomFrontR, filletFrontR, filletBottomR),
        frontRightR=firstDef(filletTopFrontR, filletFrontR, filletTopR),
        backLeftR=firstDef(filletBottomBackR, filletBackR, filletBottomR),
        backRightR=firstDef(filletTopBackR, filletBackR, filletTopR),
        r=filletR);
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

module testFilletFront() {
  qbCube([7, 6, 5], filletFrontR=2);
}

module testFilletBack() {
  rotate([0, 0, 180]) qbCube([7, 6, 5], filletBackR=2);
}

module testFilletLeft() {
  rotate([0, 0, 90]) qbCube([7, 6, 5], filletLeftR=2);
}

module testFilletRight() {
  qbCube([7, 6, 5], filletRightR=2);
}

module testFilletTop() {
  qbCube([7, 6, 5], filletTopR=2);
}

module testFilletBottom() {
  rotate([180, 0, 0]) qbCube([7, 6, 5], filletBottomR=2);
}

module testFilletR() {
  $fn=12;
  qbCube([7, 6, 5], filletR=1);
}
