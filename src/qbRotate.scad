use <functions.scad>

/**
 * Rotate children around given point.
 *
 * <openscad id="summary-example" caption="Sample mirroring">
 * use <main.scad>
 *
 * qbCube([4, 3, 2]);
 * qbRotate(z=90, at=[5, 0, 0]) qbCube([4, 3, 2]);
 * qbRotate(y=-90, at=[-1, 0, 0]) qbCube([4, 3, 2]);
 * </openscad>
 *
 * <openscad caption="Rotation around vector" visible="false">
 * use <main.scad>
 *
 * qbRotate([10, 20, 30]) qbCube([4, 3, 2]);
 * </openscad>
 *
 * <openscad caption="Rotation around single axis" visible="false">
 * use <main.scad>
 *
 * qbCube([4, 4, 2]);
 * qbRotate(z=160) qbCube([4, 4, 2]);
 * </openscad>
 *
 * <openscad caption="Rotation around a given point" visible="false">
 * use <main.scad>
 *
 * qbCube([4, 4, 2]);
 * qbRotate(z=45, at=[2, 2, 1]) qbCube([4, 4, 2]);
 * </openscad>
 *
 * @param v Rotation (in degrees) vector.
 * @param x Rotation (in degrees) around X-axis. This overrides `v[0]`.
 * @param y Rotation (in degrees) around Y-axis. This overrides `v[1]`.
 * @param z Rotation (in degrees) around Z-axis. This overrides `v[2]`.
 * @param at Center of rotation.
 */
module qbRotate(v=undef, x=undef, y=undef, z=undef, at=[0, 0, 0]) {
  ang = [firstDef(x, v[0], 0), firstDef(y, v[1], 0), firstDef(z, v[2], 0)];
  translate(at) rotate(ang) translate(-at) {
    children();
  }
}

module testRotationVector() {
  qbRotate([10, 20, 30]) cube([4, 3, 2]);
}

module testRotationX() {
  qbRotate(x=10) cube([4, 3, 2]);
}

module testRotationY() {
  qbRotate(y=20) cube([4, 3, 2]);
}

module testRotationZ() {
  qbRotate(z=30) cube([4, 3, 2]);
}

module testRotationVectorOverride() {
  qbRotate(v=[10, 20, 30], x=20, y=40, z=60) cube([4, 3, 2]);
}

module testRotationAtNonOrigin() {
    qbRotate(z=30, at=[4, 3, 2]) cube([4, 3, 2]);
}
