# This is a convenience node that automatically synchronizes an AntialiasedLine2D
# with a Polygon2D.
@tool
@icon("antialiased_polygon_2d.svg")
class_name AntialiasedPolygon2D
extends Polygon2D

@export var stroke_color := Color.BLACK:
	set = set_stroke_color
@export_range(0.0, 1000.0) var stroke_width: float = 10.0:
	set = set_stroke_width
@export var stroke_joint_mode: Line2D.LineJointMode = Line2D.LINE_JOINT_SHARP:
	set = set_stroke_joint_mode
@export_range(0.0, 1000.0) var stroke_sharp_limit: float = 2.0:
	set = set_stroke_sharp_limit
@export_range(1, 32) var stroke_round_precision: int = 8:
	set = set_stroke_round_precision

var antialiased_line_2d := AntialiasedLine2D.new()


func _ready() -> void:
	draw.connect(func() -> void: antialiased_line_2d.points = polygon)

	antialiased_line_2d.closed = true
	add_child(antialiased_line_2d, false, Node.INTERNAL_MODE_FRONT)
	antialiased_line_2d.owner = self

	stroke_color = stroke_color
	stroke_width = stroke_width
	stroke_joint_mode = stroke_joint_mode
	stroke_sharp_limit = stroke_sharp_limit
	stroke_round_precision = stroke_round_precision


func set_stroke_color(p_stroke_color: Color) -> void:
	stroke_color = p_stroke_color
	antialiased_line_2d.default_color = stroke_color


func set_stroke_width(p_stroke_width: float) -> void:
	stroke_width = p_stroke_width
	antialiased_line_2d.width = stroke_width


func set_stroke_joint_mode(p_stroke_joint_mode: Line2D.LineJointMode) -> void:
	stroke_joint_mode = p_stroke_joint_mode
	antialiased_line_2d.joint_mode = stroke_joint_mode


func set_stroke_sharp_limit(p_stroke_sharp_limit: float) -> void:
	stroke_sharp_limit = p_stroke_sharp_limit
	antialiased_line_2d.sharp_limit = stroke_sharp_limit


func set_stroke_round_precision(p_stroke_round_precision: int) -> void:
	stroke_round_precision = p_stroke_round_precision
	antialiased_line_2d.round_precision = stroke_round_precision
