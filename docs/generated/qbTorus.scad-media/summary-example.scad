use <main.scad>

qbTorus(r1=2, r2=4);
translate([-7, -7, 0]) qbTorus(r1=1, r2=2, a=270);
translate([7, -2, 0]) qbTorus(r1=1, r2=2, a=60, $fn=16);