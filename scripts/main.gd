extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().scaling_3d_scale = 0.25
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_node(^"UI/PauseMenu").connect(
		&"back_to_main_pressed", get_tree().change_scene_to_file.bind("res://scenes/menu.tscn")
	)


func _input(event: InputEvent) -> void:
	# if event.is_action_pressed(&"ui_cancel"):
	# 	get_tree().change_scene_to_file("res://scenes/menu.tscn")

	if event.is_action_pressed(&"change_mouse_input"):
		match Input.get_mouse_mode():
			Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
