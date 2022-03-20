# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- New AntialiasedPolygon2D helper node.
  - Can be used to draw 2D antialiased polygons on any platform and rendering backend,
    regardless of whether HDR is enabled.
  - Keeps a Polygon2D and an internal Line2D node with an antialiased texture
    in sync.
- New AntialiasedRegularPolygon2D helper node.
  - Can be used to draw circles, hexagons, or any other regular polygon.
  - The X/Y size and angle coverage can be adjusted.

## 1.0.0 - 2022-03-12

- Initial versioned release.

[Unreleased]: https://github.com/godot-extended-libraries/godot-antialiased-line2d/compare/v1.0.0...HEAD
