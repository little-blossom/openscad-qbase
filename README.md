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

* `qbCube` - Cube with optional fillets
* `qbCylinder` - Cylinder with optional fillets
* `qbPipe` - Pipe
* `qbSphere` - Sphere
* `qbTorus` - Torus

### Support modules

* `qbFilletCircle` - Cut-off for cylinders to get fillets.
* `qbFilletLine` - Cut-off for straight edges to get fillets.
* `qbFilletRect` - Cut-off for four straight edges that are arranged in a rectangule.

## Questions/Support

If you run into issues or have questions, please file a ticket at [GitHub](https://github.com/little-blossom/openscad-qbase/issues/new)
