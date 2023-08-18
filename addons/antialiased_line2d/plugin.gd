@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("AntialiasedLine2DTexture", "res://addons/antialiased_line2d/texture.gd")
	# Register line 2D type & its icon
	add_custom_type("AntialiasedLine2D", "Line2D", 
	preload("res://addons/antialiased_line2d/antialiased_line2d.gd"), 
	preload("res://addons/antialiased_line2d/antialiased_line2d.svg"))
	# Polygon 2D
	add_custom_type("AntialiasedPolygon2D", "Polygon2D", 
	preload("res://addons/antialiased_line2d/antialiased_polygon2d.gd"), 
	preload("res://addons/antialiased_line2d/antialiased_polygon2d.svg"))
	# # Regular Polygon 2D
	add_custom_type("AntialiasedRegularPolygon2D", "Polygon2D", 
	preload("res://addons/antialiased_line2d/antialiased_regular_polygon2d.gd"), 
	preload("res://addons/antialiased_line2d/antialiased_regular_polygon2d.svg"))


func _exit_tree() -> void:
	remove_autoload_singleton("AntialiasedLine2DTexture")
