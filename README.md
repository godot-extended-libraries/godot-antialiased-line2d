# Antialiased Line2D add-on for Godot 3.x

![Screenshot](https://raw.githubusercontent.com/Calinou/media/master/godot-antialiased-line2d-demo/screenshot.png)

**Higher-quality, more portable antialiased Line2D and Polygon2D drawing compared
to the default Godot implementation.** Also features an helper node to draw
circles and other regular polygons easily.

This repository only contains the add-on. See
[godot-extended-libraries/godot-antialiased-line2d-demo](https://github.com/godot-extended-libraries/godot-antialiased-line2d-demo)
for the demonstration project.

## Features

- Supports opaque and translucent Line2Ds with any joint and cap type
  (including multiple overlapping Line2Ds).
- Supports lines of any width (constant or variable over a curve).
  - Lines with a thickness greater than 256 pixels may appear slightly blurry,
    but will still render correctly.
- Features an *AntialiasedPolygon2D* helper node to draw 2D antialiased polygons,
  keeping the polygon and line in sync.
  - The stroke color can be set to the same color to draw an antialiased polygon
    that looks borderless, or to a different color.
- Features an AntialiasedRegularPolygon2D helper node to draw 2D antialiased circles
  and other regular polygons (such as hexagons).
  - The polygon's number of sides and angle coverage can be adjusted.
  - Like with *AntialiasedPolygon2D*, the stroke color can be set to the same color
    to draw an antialiased polygon that looks borderless, or to a different color.
- Supports Camera2D zoom and multiple resolutions.
- Works with both the GLES3 and GLES2 renderers.
- Works on desktop platforms, Android, iOS and HTML5.
- High performance, as only a single 256×256 custom texture is used.
- Can convert existing Line2D nodes to use AntialiasedLine2D
  (see the [Usage](#usage) section below).
  This way, you don't need to redraw lines you've already drawn.

The AntialiasedLine2D add-on runs both in the editor and the running project,
so you can see the line being antialiased in the editor.

## Limitations

- Due to how the texture is tiled, Line2D endings will not be antialiased.
  Only the long sides are antialiased. In practice, this still looks quite good
  most of the time. You can adjust the caps or use variable width to make
  aliasing on the ends less noticeable.
- Thin lines (1-2 pixels) won't be antialiased well (if at all).
- For lines with highly variable width and sharp corners, antialiasing quality
  may not be ideal on some parts of the line due to how Godot generates UVs
  for Line2D.
- *AntialiasedPolygon2D* and *AntialiasedRegularPolygon2D* will not fully antialias
  the polygon's edges if its stroke color is not fully opaque.

## Installation

### Using the Asset Library

- Open the Godot editor.
- Navigate to the **AssetLib** tab at the top of the editor and search for
  "antialiased line2d".
- Install the
  [*Antialiased Line2D*](https://godotengine.org/asset-library/asset/1266)
  plugin. Keep all files checked during installation.
- In the editor, open **Project > Project Settings**, go to **Plugins**
  and enable the **Antialiased Line2D** plugin.

### Manual installation

Manual installation lets you use pre-release versions of this add-on by
following its `master` branch.

- Clone this Git repository:

```bash
git clone https://github.com/godot-extended-libraries/godot-antialiased-line2d.git
```

Alternatively, you can
[download a ZIP archive](https://github.com/godot-extended-libraries/godot-antialiased-line2d/archive/master.zip)
if you do not have Git installed.

- Move the `addons/` folder to your project folder.
- In the editor, open **Project > Project Settings**, go to **Plugins**
  and enable the **Antialiased Line2D** plugin.

## Usage

### Lines

- After enabling the plugin, add an *AntialiasedLine2D* node to your scene tree dock.
  - You can also replace existing Line2D nodes by right-clicking them in the scene
    tree dock then using **Change Type** in the context menu.
- Your line will use the procedurally generated antialiasing texture.
  That's all there is to it :slightly_smiling_face:

**Note:** The **Texture** and **Tile Mode** properties are automatically set by
the add-on. Changes to these properties will be lost when running the project
or reloading the scene in the editor.

### Polygons

- After enabling the plugin, add an *AntialiasedPolygon2D* node to your scene tree dock.
  - You can also replace existing Polygon2D nodes by right-clicking them in the scene
    tree dock then using **Change Type** in the context menu.
- Your polygon will use the procedurally generated antialiasing texture on the edges.
  To make an antialiased 2D polygon that *looks* borderless, set the **Stroke Color**
  property to be the same color as the Polygon2D's fill color.
  That's all there is to it :slightly_smiling_face:

### Circles

- After enabling the plugin, add an *AntialiasedRegularPolygon2D* node to your scene tree dock.
  - You can also replace existing Polygon2D nodes by right-clicking them in the scene
    tree dock then using **Change Type** in the context menu.
- Your circle will use the procedurally generated antialiasing texture on the edges.
  To make an antialiased 2D circle that *looks* borderless, set the **Stroke Color**
  property to be the same color as the Polygon2D's fill color.
  That's all there is to it :slightly_smiling_face:

**Note:** Do not enable the Line2D or Polygon2D built-in **Antialiased** property,
as it is unnecessary with this add-on; it will only worsen the antialiasing quality.

## How it works behind the scenes

1. A texture with custom mipmaps is procedurally generated in GDScript to handle
   arbitrary line widths and zoom.
2. The texture is [generated once in an autoload](addons/antialiased_line2D/texture.gd)
   and is [reused](addons/antialiased_line2d/antialiased_line2d.gd). This means
   performance doesn't suffer when instantiating Line2D nodes at run-time.
3. The texture is loaded in a Line2D's texture slot. The polygon or UV generation
   algorithm remains unchanged.
4. The hardware automatically determines which mipmap to use, making the rendering very fast.
5. For *AntialiasedPolygon2D*, it adds a Line2D as a child node to the Polygon2D
   and assigns the antialiased line texture to it. The line is automatically kept in
   sync with the polygon's points, with an additional point added so it forms a
   closed polyline.

## License

Copyright © 2022 Hugo Locurcio and contributors

Unless otherwise specified, files in this repository are licensed under the
MIT license. See [LICENSE.md](LICENSE.md) for more information.
