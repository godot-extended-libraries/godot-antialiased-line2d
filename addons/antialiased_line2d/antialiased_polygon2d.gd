# This is a convenience node that automatically synchronizes an AntialiasedLine2D
# with a Polygon2D.
@tool
@icon("antialiased_polygon2d.svg")
class_name AntialiasedPolygon2D
extends Polygon2D

@export var stroke_color := Color(0.4, 0.5, 1.0): set = set_stroke_color
@export_range(0.0, 1000.0) var stroke_width:float = 10.0: set = set_stroke_width
@export var stroke_joint_mode:Line2D.LineJointMode = Line2D.LINE_JOINT_SHARP: set = set_stroke_joint_mode
@export_range(0.0, 1000.0) var stroke_sharp_limit:float = 2.0: set = set_stroke_sharp_limit
@export_range(1, 32) var stroke_round_precision: int = 8: set = set_stroke_round_precision

var line_2d := Line2D.new()


func _ready() -> void:
	line_2d.texture = AntialiasedLine2DTexture.texture
	line_2d.texture_mode = Line2D.LINE_TEXTURE_TILE
	line_2d.texture_filter = TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC
	if polygon.size() >= 1:
		line_2d.points = AntialiasedLine2D.construct_closed_line(polygon)
	add_child(line_2d)


func _set(property: StringName, value: Variant) -> bool:
	if property == &"polygon":
		line_2d.points = AntialiasedLine2D.construct_closed_line(polygon)

	return false


func set_stroke_color(p_stroke_color: Color) -> void:
	stroke_color = p_stroke_color
	line_2d.default_color = stroke_color


func set_stroke_width(p_stroke_width: float) -> void:
	stroke_width = p_stroke_width
	line_2d.width = stroke_width


func set_stroke_joint_mode(p_stroke_joint_mode: Line2D.LineJointMode) -> void:
	stroke_joint_mode = p_stroke_joint_mode
	line_2d.joint_mode = stroke_joint_mode


func set_stroke_sharp_limit(p_stroke_sharp_limit: float) -> void:
	stroke_sharp_limit = p_stroke_sharp_limit
	line_2d.sharp_limit = stroke_sharp_limit


func set_stroke_round_precision(p_stroke_round_precision: int) -> void:
	stroke_round_precision = p_stroke_round_precision
	line_2d.round_precision = stroke_round_precision
