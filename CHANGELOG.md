# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2024-06-26

### Changed

- Updated add-on for Godot 4.2.2.
- Anisotropic filtering is now used to improve quality.
  - To ensure the best possible quality, it's recommended to set the
    **Anisotropic Filtering Level** project setting to 16× (default is 4×).

### Fixed

- [Fix AntialiasedPolygon2D and AntialiasedRegularPolygon2D setters not working.](https://github.com/godot-extended-libraries/godot-antialiased-line2d/issues/6)

## [1.1.1] - 2022-06-26

### Fixed

- [Polygon border line is now seamless, hiding visibly rounded ends.](https://github.com/godot-extended-libraries/godot-antialiased-line2d/pull/4)

## [1.1.0] - 2022-03-21

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

[Unreleased]: https://github.com/godot-extended-libraries/godot-antialiased-line2d/compare/v1.1.1...HEAD
[1.1.1]: https://github.com/godot-extended-libraries/godot-antialiased-line2d/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/godot-extended-libraries/godot-antialiased-line2d/compare/v1.0.0...v1.1.0
