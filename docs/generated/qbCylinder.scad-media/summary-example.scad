use <main.scad>

qbCylinder(r=5, h=8);
translate([-7, -6, 0])
  qbCylinder(r=3, h=4, filletR=1, $fn=20);
translate([9, -1, 0])
  qbCylinder(r=1, h=5, filletTopR=0.4, $fn=16);