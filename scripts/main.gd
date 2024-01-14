extends Node3D


func _init():
	if OS.is_debug_build():
		Log.current_log_level = Log.LogLevel.DEBUG
	else:
		Log.current_log_level = Log.LogLevel.ERROR


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().scaling_3d_scale = 0.25
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

	if event.is_action_pressed(&"change_mouse_input"):
		match Input.get_mouse_mode():
			Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
