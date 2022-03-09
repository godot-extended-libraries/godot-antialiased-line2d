tool
class_name AntialiasedLine2D, "antialiased_line2d.svg"
extends Line2D


func _ready() -> void:
	texture = AntialiasedLine2DTexture.texture
	texture_mode = Line2D.LINE_TEXTURE_TILE
