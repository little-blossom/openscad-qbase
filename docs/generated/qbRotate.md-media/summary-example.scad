use <main.scad>

qbCube([4, 3, 2]);
qbRotate(z=90, at=[5, 0, 0]) qbCube([4, 3, 2]);
qbRotate(y=-90, at=[-1, 0, 0]) qbCube([4, 3, 2]);