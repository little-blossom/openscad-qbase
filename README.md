# openscad-qbase

Basic extension library for [OpenSCAD](http://www.openscad.org/) primitives.

* [Installation](#installation)
* [Provided modules](#provided-modules)
* [Questions/Support](#questionssupport)

[![Build Status](https://travis-ci.org/little-blossom/openscad-qbase.svg?branch=master)](https://travis-ci.org/little-blossom/openscad-qbase)

## Installation

* Clone this repository.
* Add the following line to make `openscad-qbase` available:
```
use </path/to/openscad-qbase/clone/main.scad>
```
* Done. You can now use `qbCube`, `qbTorus`, and all other `openscad-qbase` modules.

## Provided modules

`openscad-qbase` provides the following modules

### Main modules

* `qbCube` - Cube with optional fillets ([details](https://little-blossom.github.io/openscad-qbase/generated/qbCube))
* `qbCylinder` - Cylinder with optional fillets ([details](https://little-blossom.github.io/openscad-qbase/generated/qbCylinder))
* `qbPipe` - Pipe ([details](https://little-blossom.github.io/openscad-qbase/generated/qbPipe))
* `qbSphere` - Sphere ([details](https://little-blossom.github.io/openscad-qbase/generated/qbSphere))
* `qbTorus` - Torus ([details](https://little-blossom.github.io/openscad-qbase/generated/qbTorus))

### Support modules

* `qbFilletCircle` - Cut-off for cylinders to get fillets ([details](https://little-blossom.github.io/openscad-qbase/generated/qbFilletCircle))
* `qbFilletLine` - Cut-off for straight edges to get fillets ([details](https://little-blossom.github.io/openscad-qbase/generated/qbFilletLine))
* `qbFilletRect` - Cut-off for four straight edges that are arranged in a rectangle ([details](https://little-blossom.github.io/openscad-qbase/generated/qbFilletRect))

## Questions/Support

If you run into issues or have questions, please file a ticket at [GitHub](https://github.com/little-blossom/openscad-qbase/issues/new)
