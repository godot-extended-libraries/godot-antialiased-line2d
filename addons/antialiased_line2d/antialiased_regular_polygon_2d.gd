# This is a convenience node that automatically synchronizes an AntialiasedLine2D
# with a Polygon2D, while also generating a regular Polygon2D shape (hexagon, octagon, …).
@tool
@icon("antialiased_regular_polygon_2d.svg")
class_name AntialiasedRegularPolygon2D
extends AntialiasedPolygon2D

@export_custom(PROPERTY_HINT_LINK, "suffix:px") var size := Vector2(64.0, 64.0):
	set = set_size
@export_range(3, 128, 1, "or_greater") var sides := 32:
	set = set_sides
@export_range(-360, 360.0, 0.01, "radians_as_degrees", "prefer_slider") var arc := TAU:
	set = set_arc


func _ready() -> void:
	super()
	for connection: Dictionary in draw.get_connections():
		draw.disconnect(connection.callable)
	_update_points()


func _update_points() -> void:
	polygon = build_polygon(size, sides, arc)
	antialiased_line_2d.points = polygon


func set_size(p_size: Vector2) -> void:
	size = p_size
	_update_points()


func set_sides(p_sides: int) -> void:
	sides = p_sides
	_update_points()


func set_arc(p_arc: float) -> void:
	arc = clampf(p_arc, -TAU, TAU)
	_update_points()


static func build_polygon(size: Vector2, sides := 32, arc := TAU, has_point_at_origin := true) -> PackedVector2Array:
	var result := PackedVector2Array()
	var half_size := size * 0.5
	for side: int in range(sides):
		result.push_back(Vector2.RIGHT.rotated(side / float(sides) * arc) * half_size)

	if not is_equal_approx(absf(arc), TAU):
		result.push_back(Vector2.RIGHT.rotated(arc) * half_size)
		if has_point_at_origin:
			result.push_back(Vector2.ZERO)
	return result
