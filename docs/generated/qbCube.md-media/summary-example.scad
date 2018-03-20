use <main.scad>

qbCube([3, 4, 5]);
translate([-8, -6, 0])
  qbCube([6, 6, 5], filletR=1, $fn=20);
translate([5, 3, 0])
  qbCube([5, 5, 5], filletFrontLeftR=1, filletFrontRightR=1, filletBackRightR=3, $fn=16);