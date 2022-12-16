use <main.scad>

qbMirror([1, 0, 0], copy=true) {
  translate([1, 1, 0]) qbCube([3, 4, 5]);
  translate([6, 4, 0]) qbCylinder(r=3, h=6);
}

translate([1, -5, 0]) qbCube([3, 4, 2]);
qbMirror([1, 0.5, 0.2]) translate([1, -5, 0]) qbCube([3, 4, 2]);