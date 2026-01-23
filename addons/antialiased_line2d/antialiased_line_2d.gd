@tool
@icon("antialiased_line_2d.svg")
class_name AntialiasedLine2D
extends Line2D

const TEXTURE = preload("antialiased_texture.res")

@export_storage var _is_instantiated := false


func _ready() -> void:
	if _is_instantiated:
		return

	texture = TEXTURE
	texture_mode = Line2D.LINE_TEXTURE_TILE
	texture_filter = TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC

	_is_instantiated = true


func _property_can_revert(property: StringName) -> bool:
	return property in [&"texture", &"texture_mode", &"texture_filter"]


func _property_get_revert(property: StringName) -> Variant:
	if property == &"texture":
		return TEXTURE
	elif property == &"texture_mode":
		return Line2D.LINE_TEXTURE_TILE
	elif property == &"texture_filter":
		return TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC
	return null
