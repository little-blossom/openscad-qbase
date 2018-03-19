use <functions.scad>
use <qbFilletRect.scad>

/**
 * Cube with optional fillets.
 *
 * <openscad id="summary-example" caption="Sample cubes">
 * use <main.scad>
 *
 * qbCube([3, 4, 5]);
 * translate([-8, -6, 0])
 *   qbCube([6, 6, 5], filletR=1, $fn=20);
 * translate([5, 3, 0])
 *   qbCube([5, 5, 5], filletFrontLeftR=1, filletFrontRightR=1, filletBackRightR=3, $fn=16);
 * </openscad>
 *
 * @param size Size of the cube.
 * @param filletFrontLeftR Radius of fillet for front left edge.
 * @param filletFrontRightR Radius of fillet for front right edge.
 * @param filletBackLeftR Radius of fillet for back left edge.
 * @param filletBackRightR Radius of fillet for back right edge.
 * @param filletBottomLeftR Radius of fillet for bottom left edge.
 * @param filletBottomRightR Radius of fillet for bottom right edge.
 * @param filletTopLeftR Radius of fillet for top left edge.
 * @param filletTopRightR Radius of fillet for top right edge.
 * @param filletBottomFrontR Radius of fillet for bottom front edge.
 * @param filletTopFrontR Radius of fillet for top front edge.
 * @param filletBottomBackR Radius of fillet for bottom back edge.
 * @param filletTopBackR Radius of fillet for top back edge.
 * @param filletFrontR Radius of fillets of edges around the cube's front.
 * @param filletBackR Radius of fillets of edges around the cube's back.
 * @param filletLeftR Radius of fillets of edges around the cube's left side.
 * @param filletRightR Radius of fillets of edges around the cube's right side.
 * @param filletTopR Radius of fillets of edges around the cube's top.
 * @param filletBottomR Radius of fillets of edges around the cube's bottom.
 * @param filletR Radius of fillets of all edges of the cube.
 */
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
