use <main.scad>

qbPipe(r1=5, r2=3, h=7);
translate([-6, -10, 0])
  qbPipe(r1=4, r2=3, h=4, a=100);
translate([10, -2, 0])
  qbPipe(r1=3, r2=1, h=1, a=270, $fn=16);