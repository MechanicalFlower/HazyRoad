class_name Car
extends Receptacle

@export_multiline var translation_keys_first_state: Array[String] = []
@export_multiline var translation_keys_second_state: Array[String] = []

var _activated_num_fuse: int = 0

@onready var tween: Tween
@onready var _initial_position = position
@onready var _initial_rotation = rotation_degrees


func _ready():
	_send_signal = false
	# gdlint:ignore = private-method-call
	super._ready()

	_state = true
	_toggle()

	GlobalSignal.add_listener(&"fuse_box_green_state_updated", _on_FuseBox_state_updated)


func _on_FuseBox_state_updated(receptacle_state: bool):
	if receptacle_state:
		_activated_num_fuse += 1
	else:
		_activated_num_fuse -= 1

	if _state:
		_state = !(_activated_num_fuse == 2)
		_toggle()


func interact():
	if _current_item == item_to_interact:
		# The car is repair, so drop the trip from the player hand
		GlobalSignal.trigger_signal(&"current_item_updated", [&""])

		_state = true
		_toggle()

		_is_interactable = false
		GlobalSignal.trigger_signal(&"game_finished")
	else:
		super.interact()


func _toggle():
	if _state:
		position = _initial_position
		rotation_degrees = _initial_rotation
		translation_keys = translation_keys_first_state
	else:
		position.y = _initial_position.y + -0.394
		rotation_degrees = _initial_rotation + Vector3(-2.3, -2.7, -5.9)
		translation_keys = translation_keys_second_state
