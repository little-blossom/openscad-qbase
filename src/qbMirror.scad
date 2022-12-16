/**
 * Mirror of children, while optionally copying them.
 *
 * <openscad id="summary-example" caption="Sample mirroring">
 * use <main.scad>
 *
 * qbMirror([1, 0, 0], copy=true) {
 *   translate([1, 1, 0]) qbCube([3, 4, 5]);
 *   translate([6, 4, 0]) qbCylinder(r=3, h=6);
 * }
 *
 * translate([1, -5, 0]) qbCube([3, 4, 2]);
 * qbMirror([1, 0.5, 0.2]) translate([1, -5, 0]) qbCube([3, 4, 2]);
 * </openscad>
 *
 * <openscad caption="Mirror without copy" visible="false">
 * use <main.scad>
 *
 * qbMirror([1, 0, 0.3]) qbCube([7, 7, 7]);
 * </openscad>
 *
 * <openscad caption="Mirror with copy" visible="false">
 * use <main.scad>
 *
 * qbMirror([1, 0, 0.3], copy=true) qbCube([7, 7, 7]);
 * </openscad>
 *
 * @param normal Normal vector on the mirroring plane.
 * @param copy If true, copy the children before mirroring them.
 */
module qbMirror(normal, copy=false) {
    if (copy) {
        children();
    }
    mirror(normal) children();
}

module testSkewDefaultCopy() {
  qbMirror(normal=[1, 2, 3]) cube([1, 2, 3]);
}

module testSkew() {
  qbMirror(normal=[1, 2, 3], copy=false) cube([1, 2, 3]);
}

module testSkewCopy() {
  qbMirror(normal=[1, 2, 3], copy=true) cube([1, 2, 3]);
}
