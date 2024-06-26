@tool
@icon("antialiased_line2d.svg")
class_name AntialiasedLine2D
extends Line2D


func _ready() -> void:
	texture = AntialiasedLine2DTexture.texture
	texture_mode = Line2D.LINE_TEXTURE_TILE
	texture_filter = TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC


static func construct_closed_line(p_polygon: PackedVector2Array) -> PackedVector2Array:
	var end_point: Vector2 = p_polygon[p_polygon.size() - 1]
	var distance: float = end_point.distance_to(p_polygon[0]) # distance to start point
	var bridge_point: Vector2 = end_point.move_toward(p_polygon[0], distance * 0.5)
	# Close the polygon drawn by the line by adding superimposed bridge points between the start and end points.
	var polygon_line := p_polygon
	polygon_line.push_back(bridge_point)
	polygon_line.insert(0, bridge_point)

	return polygon_line
