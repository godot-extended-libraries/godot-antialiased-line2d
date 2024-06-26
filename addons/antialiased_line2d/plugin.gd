@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("AntialiasedLine2DTexture", "res://addons/antialiased_line2d/texture.gd")


func _exit_tree() -> void:
	remove_autoload_singleton("AntialiasedLine2DTexture")
