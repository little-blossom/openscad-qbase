use <main.scad>

qbSphere(r=5);
translate([10, 0, 0]) qbSphere(rX=2, rY=3, rZ=4);
translate([-1, -14, 6]) qbSphere(rX=2, rY=1, rZ=1, $fn=15);