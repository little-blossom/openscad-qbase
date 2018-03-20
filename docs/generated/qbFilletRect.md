# qbFilletRect

Links: ([source](https://github.com/little-blossom/openscad-qbase/blob/master/qbFilletRect.scad)) ([raw source](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/qbFilletRect.scad)) ([package overview](overview.md)) ([documentation home](../index.md))

Solid to substract from a cube get a fillet along `Z`-edges.

* [Description](#description)
* [Arguments](#arguments)
* [Examples](#examples)
  * [Example 1: Sample rect fillets](#example-1-sample-rect-fillets)

## Description


Solid to substract from a cube get a fillet along `Z`-edges.

| [![summary-example](qbFilletRect.md-media/summary-example.png "summary-example")](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletRect.md-media/summary-example.png) |
| :---: |
|Example 1: Sample rect fillets [(source)](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletRect.md-media/summary-example.scad)[(raw)](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/docs/generated/qbFilletRect.md-media/summary-example.scad)|



## Arguments

<table>
<tr><th>Position</th><th>Name</th><th>Default</th><th>Description</th></tr>
<tr><td>1</td><td><code>size</code></td><td><code>[10, 10, 10]</code></td><td>The size of the cube to get fillets for.</td></tr>
<tr><td>2</td><td><code>frontLeftR</code></td><td><code>undef</code></td><td>Radius of fillet for front left edge.</td></tr>
<tr><td>3</td><td><code>frontRightR</code></td><td><code>undef</code></td><td>Radius of fillet for front right edge.</td></tr>
<tr><td>4</td><td><code>backLeftR</code></td><td><code>undef</code></td><td>Radius of fillet for back left edge.</td></tr>
<tr><td>5</td><td><code>backRightR</code></td><td><code>undef</code></td><td>Radius of fillet for back right edge.</td></tr>
<tr><td>6</td><td><code>r</code></td><td><code>undef</code></td><td>Radius of fillets of all `Z`-edges of the cube.</td></tr>
</table>

## Examples

* [Example 1: Sample rect fillets](#example-1-sample-rect-fillets)

### Example 1: Sample rect fillets


```openscad
use <main.scad>

qbFilletRect([8, 6, 6], r=2, $fn=16);
```
| [![summary-example](qbFilletRect.md-media/summary-example.png "summary-example")](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletRect.md-media/summary-example.png) |
| :---: |
|Example 1: Sample rect fillets [(source)](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletRect.md-media/summary-example.scad)[(raw)](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/docs/generated/qbFilletRect.md-media/summary-example.scad)|


Links: ([source](https://github.com/little-blossom/openscad-qbase/blob/master/qbFilletRect.scad)) ([raw source](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/qbFilletRect.scad)) ([package overview](overview.md)) ([documentation home](../index.md))
