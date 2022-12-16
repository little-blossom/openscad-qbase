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
 * <openscad caption="Plain cube" visible="false">
 * use <main.scad>
 *
 * qbCube([7, 7, 7]);
 * </openscad>
 *
 * <openscad caption="Cube with fillet on sides" visible="false">
 * use <main.scad>
 *
 * qbCube([7, 7, 7], filletLeftR=1, filletRightR=2, $fn=16);
 * </openscad>
 *
 * <openscad caption="Cube with fillet on edges" visible="false">
 * use <main.scad>
 *
 * qbCube([7, 7, 7], filletFrontLeftR=2, filletTopFrontR=1, filletTopRightR=3, $fn=48);
 * </openscad>
 *
 * <openscad caption="Cube with fillets on all edges" visible="false">
 * use <main.scad>
 *
 * qbCube([7, 7, 7], filletR=2, $fn=32);
 * </openscad>
 *
 * <openscad caption="Cube with overly big fillet on edge" visible="false">
 * use <main.scad>
 *
 * qbCube([7, 7, 7], filletTopRightR=5, filletBottomLeftR=5, $fn=32);
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

    eFilletFrontLeftR = firstDef(filletFrontLeftR, filletFrontR, filletLeftR, filletR);
    eFilletFrontRightR = firstDef(filletFrontRightR, filletFrontR, filletRightR, filletR);
    eFilletBackLeftR = firstDef(filletBackLeftR, filletBackR, filletLeftR, filletR);
    eFilletBackRightR = firstDef(filletBackRightR, filletBackR, filletRightR, filletR);

    eFilletBottomLeftR=firstDef(filletBottomLeftR, filletLeftR, filletBottomR, filletR);
    eFilletBottomRightR=firstDef(filletBottomRightR, filletRightR, filletBottomR, filletR);
    eFilletTopLeftR=firstDef(filletTopLeftR, filletLeftR, filletTopR, filletR);
    eFilletTopRightR=firstDef(filletTopRightR, filletRightR, filletTopR, filletR);

    eFilletBottomFrontR=firstDef(filletBottomFrontR, filletFrontR, filletBottomR, filletR);
    eFilletTopFrontR=firstDef(filletTopFrontR, filletFrontR, filletTopR, filletR);
    eFilletBottomBackR=firstDef(filletBottomBackR, filletBackR, filletBottomR, filletR);
    eFilletTopBackR=firstDef(filletTopBackR, filletBackR, filletTopR, filletR);

    qbFilletRect(size=size,
      frontLeftR=eFilletFrontLeftR, frontRightR=eFilletFrontRightR,
      backLeftR=eFilletBackLeftR, backRightR=eFilletBackRightR);

    translate([0, size[1], 0])
      rotate(a=[90, 0, 0])
      qbFilletRect(size=[size[0], size[2], size[1]],
        frontLeftR=eFilletBottomLeftR, frontRightR=eFilletBottomRightR,
        backLeftR=eFilletTopLeftR, backRightR=eFilletTopRightR);

    translate([size[0], 0, 0])
      rotate(a=[0, -90, 0])
      qbFilletRect(size=[size[2], size[1], size[0]],
        frontLeftR=eFilletBottomFrontR, frontRightR=eFilletTopFrontR,
        backLeftR=eFilletBottomBackR, backRightR=eFilletTopBackR);
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
