# qbFilletCircle

Links: ([source](https://github.com/little-blossom/openscad-qbase/blob/master/qbFilletCircle.scad)) ([raw source](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/qbFilletCircle.scad)) ([package overview](overview.md)) ([documentation home](../index.md))

Solid to substract from cylinder to get fillets.

* [Description](#description)
* [Arguments](#arguments)
* [Examples](#examples)
  * [Example 1: Sample circle fillets](#example-1-sample-circle-fillets)

## Description


Solid to substract from cylinder to get fillets.

| [![summary-example](qbFilletCircle.md-media/summary-example.png "summary-example")](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletCircle.md-media/summary-example.png) |
| :---: |
|Example 1: Sample circle fillets [(source)](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletCircle.md-media/summary-example.scad)[(raw)](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/docs/generated/qbFilletCircle.md-media/summary-example.scad)|



## Arguments

<table>
<tr><th>Position</th><th>Name</th><th>Default</th><th>Description</th></tr>
<tr><td>1</td><td><code>circleR</code></td><td><code>3</code></td><td>Radius of the cylinder.</td></tr>
<tr><td>2</td><td><code>filletR</code></td><td><code>1</code></td><td>Radius of the desired fillet.</td></tr>
</table>

## Examples

* [Example 1: Sample circle fillets](#example-1-sample-circle-fillets)

### Example 1: Sample circle fillets


```openscad
use <main.scad>

rotate([180, 0, 0]) qbFilletCircle(circleR=6, filletR=2);
```
| [![summary-example](qbFilletCircle.md-media/summary-example.png "summary-example")](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletCircle.md-media/summary-example.png) |
| :---: |
|Example 1: Sample circle fillets [(source)](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletCircle.md-media/summary-example.scad)[(raw)](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/docs/generated/qbFilletCircle.md-media/summary-example.scad)|


Links: ([source](https://github.com/little-blossom/openscad-qbase/blob/master/qbFilletCircle.scad)) ([raw source](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/qbFilletCircle.scad)) ([package overview](overview.md)) ([documentation home](../index.md))
