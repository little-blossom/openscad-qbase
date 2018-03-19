/**
 * Sphere.
 *
 * <openscad id="summary-example" caption="Sample sphere">
 * use <main.scad>
 *
 * qbSphere(r=5);
 * </openscad>
 *
 * @param r  Radius of the sphere.
 */
module qbSphere(r=1) {
    sphere(r=r);
};

// ----------------------------------------
// Tests

module testPlain() {
    qbSphere(r=4);
}

module testFn() {
    qbSphere(r=5, $fn=5);
}