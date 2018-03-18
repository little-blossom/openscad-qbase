/**
 * Sphere.
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