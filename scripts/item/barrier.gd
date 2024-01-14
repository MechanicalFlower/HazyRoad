class_name Barrier
extends Mechanism

var _activated_num_fuse: int = 0

@onready var collision_shape: CollisionShape3D = get_node(^"CollisionShape3D")
@onready var barrier1: MeshInstance3D = get_node(^"Barrier1")
@onready var barrier2: MeshInstance3D = get_node(^"Barrier2")


func toggle(receptacle_state: bool):
	if receptacle_state:
		_activated_num_fuse += 1
	else:
		_activated_num_fuse -= 1

	if _is_active():
		Log.debug("Open the Barrier")
		collision_shape.set_disabled(true)
		barrier1.hide()
		barrier1.set_process_mode(PROCESS_MODE_DISABLED)
		barrier2.show()
		barrier2.set_process_mode(PROCESS_MODE_INHERIT)
		_is_interactable = false

	else:
		Log.debug("Close the Barrier")
		collision_shape.set_disabled(false)
		barrier1.show()
		barrier1.set_process_mode(PROCESS_MODE_INHERIT)
		barrier2.hide()
		barrier2.set_process_mode(PROCESS_MODE_DISABLED)
		_is_interactable = true


func _is_active() -> bool:
	return _activated_num_fuse == 2
