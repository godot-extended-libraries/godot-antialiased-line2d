# This is a convenience node that automatically synchronizes an AntialiasedLine2D
# with a Polygon2D, while also generating a regular Polygon2D shape (hexagon, octagon, …).
tool
class_name AntialiasedRegularPolygon2D, "antialiased_regular_polygon2d.svg"
extends Polygon2D

export var size := Vector2(64, 64) setget set_size
export(int, 3, 128) var sides := 32 setget set_sides
export(float, 0.0, 360.0) var angle_degrees := 360.0 setget set_angle_degrees

export var stroke_color := Color(0.4, 0.5, 1.0) setget set_stroke_color
export(float, 0.0, 1000.0) var stroke_width := 10.0 setget set_stroke_width
export(int, "Sharp", "Bevel", "Round") var stroke_joint_mode := Line2D.LINE_JOINT_SHARP setget set_stroke_joint_mode
export(float, 0.0, 1000.0) var stroke_sharp_limit := 2.0 setget set_stroke_sharp_limit
export(int, 1, 32) var stroke_round_precision := 8 setget set_stroke_round_precision

var line_2d := Line2D.new()


func _ready() -> void:
	line_2d.texture = AntialiasedLine2DTexture.texture
	line_2d.texture_mode = Line2D.LINE_TEXTURE_TILE
	update_points()
	add_child(line_2d)


func _set(property: String, value) -> bool:
	if property == "polygon":
		line_2d.points = AntialiasedLine2D.construct_closed_line(polygon)
	return false


func update_points() -> void:
	var points := PoolVector2Array()
	for side in sides:
		points.push_back(Vector2(0, -1).rotated(side / float(sides) * deg2rad(angle_degrees)) * size * 0.5)
	if not is_equal_approx(angle_degrees, 360.0):
		points.push_back(Vector2.ZERO)
	polygon = points
	# Force an update of the Line2D here to prevent it from getting out of sync.
	line_2d.points = AntialiasedLine2D.construct_closed_line(polygon)


func set_size(p_size: Vector2) -> void:
	size = p_size
	update_points()


func set_sides(p_sides: int) -> void:
	sides = p_sides
	update_points()


func set_angle_degrees(p_angle_degrees: float) -> void:
	angle_degrees = p_angle_degrees
	update_points()


func set_stroke_color(p_stroke_color: Color) -> void:
	stroke_color = p_stroke_color
	line_2d.default_color = stroke_color


func set_stroke_width(p_stroke_width: float) -> void:
	stroke_width = p_stroke_width
	line_2d.width = stroke_width


func set_stroke_joint_mode(p_stroke_joint_mode: int) -> void:
	stroke_joint_mode = p_stroke_joint_mode
	line_2d.joint_mode = stroke_joint_mode


func set_stroke_sharp_limit(p_stroke_sharp_limit: float) -> void:
	stroke_sharp_limit = p_stroke_sharp_limit
	line_2d.sharp_limit = stroke_sharp_limit


func set_stroke_round_precision(p_stroke_round_precision: int) -> void:
	stroke_round_precision = p_stroke_round_precision
	line_2d.round_precision = stroke_round_precision
