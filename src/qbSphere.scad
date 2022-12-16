use <functions.scad>

/**
 * Sphere.
 *
 * <openscad id="summary-example" caption="Sample sphere">
 * use <main.scad>
 *
 * qbSphere(r=5);
 * translate([10, 0, 0]) qbSphere(rX=2, rY=3, rZ=4);
 * translate([-1, -14, 6]) qbSphere(rX=2, rY=1, rZ=1, $fn=15);
 * </openscad>
 *
 * <openscad caption="Uniform sphere" visible="false">
 * use <main.scad>
 *
 * qbSphere(r=5);
 * </openscad>
 *
 * <openscad caption="Non-uniform sphere" visible="false">
 * use <main.scad>
 *
 * qbSphere(r=5, rZ=3);
 * </openscad>
 *
 * @param r  Default radius of the sphere (see also `rX`, `rY`, and `rZ`).
 * @param rX  Radius of the sphere in X direction. If undefined, use `r`.
 * @param rY  Radius of the sphere in Y direction. If undefined, use `r`.
 * @param rZ  Radius of the sphere in Z direction. If undefined, use `r`.
 */
module qbSphere(r=1, rX=undef, rY=undef, rZ=undef) {
    eRX = firstDef(rX, r);
    eRY = firstDef(rY, r);
    eRZ = firstDef(rZ, r);
    maxR = max(eRX, eRY, eRZ);
    if ((eRX == maxR) && (eRY == maxR) && (eRZ == maxR)) {
        sphere(r=maxR);
    } else {
        if (maxR > 0) {
            scale([eRX / maxR, eRY / maxR, eRZ / maxR]) qbSphere(r=maxR);
        }
    }
};

// ----------------------------------------
// Tests

module testPlain() {
    qbSphere(r=4);
}

module testFn() {
    qbSphere(r=5, $fn=5);
}

module testRx() {
    qbSphere(r=5, rX=3);
}

module testRy() {
    qbSphere(r=5, rY=3);
}

module testRz() {
    qbSphere(r=5, rZ=3);
}

module testDifferentRs() {
    qbSphere(rX=2, rY=4, rZ=6);
}
