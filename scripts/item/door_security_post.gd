class_name DoorSecurityPost
extends Mechanism

var _activated_num_fuse: int = 0
var _open: bool = false

@onready var initial_rotation: Vector3 = rotation_degrees
@onready var tween: Tween


func _ready():
	tween = get_tree().create_tween()
	tween.stop()

	# gdlint:ignore = private-method-call
	super._ready()


func toggle(receptacle_state: bool):
	if receptacle_state:
		_activated_num_fuse += 1
	else:
		_activated_num_fuse -= 1

	if _is_active():
		tween.tween_property(self, "rotation_degrees:y", initial_rotation.y + 135, 1)
		tween.set_trans(Tween.TRANS_SINE)
		tween.play()
		_open = true
		_is_interactable = false

	elif _open:
		tween.tween_property(self, "rotation_degrees:y", initial_rotation.y, 1)
		tween.set_trans(Tween.TRANS_SINE)
		tween.play()
		_is_interactable = true


func _is_active() -> bool:
	return _activated_num_fuse == 2
