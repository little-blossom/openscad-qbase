# qbFilletLine

Links: ([source](https://github.com/little-blossom/openscad-qbase/blob/master/qbFilletLine.scad)) ([raw source](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/qbFilletLine.scad)) ([package overview](overview.md)) ([documentation home](../index.md))

Solid to substract from an edge to get a fillet.

* [Description](#description)
* [Arguments](#arguments)
* [Examples](#examples)
  * [Example 1: Sample edge fillets](#example-1-sample-edge-fillets)

## Description


Solid to substract from an edge to get a fillet.

| [![summary-example](qbFilletLine.md-media/summary-example.png "summary-example")](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletLine.md-media/summary-example.png) |
| :---: |
|Example 1: Sample edge fillets [(source)](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletLine.md-media/summary-example.scad)[(raw)](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/docs/generated/qbFilletLine.md-media/summary-example.scad)|



## Arguments

<table>
<tr><th>Position</th><th>Name</th><th>Default</th><th>Description</th></tr>
<tr><td>1</td><td><code>r</code></td><td><code>undef</code></td><td>Radius of the desired fillet.</td></tr>
<tr><td>2</td><td><code>h</code></td><td><code>undef</code></td><td>Height of the edge to build the fillet for.</td></tr>
</table>

## Examples

* [Example 1: Sample edge fillets](#example-1-sample-edge-fillets)

### Example 1: Sample edge fillets


```openscad
use <main.scad>

rotate([0, 0, 270]) qbFilletLine(r=5, h=7);
```
| [![summary-example](qbFilletLine.md-media/summary-example.png "summary-example")](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletLine.md-media/summary-example.png) |
| :---: |
|Example 1: Sample edge fillets [(source)](https://github.com/little-blossom/openscad-qbase/blob/master/docs/generated/qbFilletLine.md-media/summary-example.scad)[(raw)](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/docs/generated/qbFilletLine.md-media/summary-example.scad)|


Links: ([source](https://github.com/little-blossom/openscad-qbase/blob/master/qbFilletLine.scad)) ([raw source](https://raw.githubusercontent.com/little-blossom/openscad-qbase/master/qbFilletLine.scad)) ([package overview](overview.md)) ([documentation home](../index.md))
