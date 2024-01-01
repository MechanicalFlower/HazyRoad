class_name Grid
extends Mechanism

enum ScopedColor { YELLOW, BLUE, RED, GREEN }

@export var color: ScopedColor
@export_range(1, 2, 1) var required_num_fuse: int = 1

var _activated_num_fuse: int = 0
var _state: bool = false

@onready var sfx := get_node(^"MetalSlideSFX")
@onready var mesh: MeshInstance3D = get_node(^"MeshInstance3D")
@onready var initial: Vector3 = get_node(^"Initial").global_position
@onready var target: Vector3 = get_node(^"Target").global_position
@onready var tween: Tween


func _ready():
	# gdlint:ignore = private-method-call
	super._ready()

	var material = mesh.get_active_material(0)
	if material is BaseMaterial3D:
		match color:
			ScopedColor.YELLOW:
				material.set_albedo(Color.YELLOW)
			ScopedColor.RED:
				material.set_albedo(Color.RED)
			ScopedColor.BLUE:
				material.set_albedo(Color.BLUE)
			ScopedColor.GREEN:
				material.set_albedo(Color.GREEN)
	mesh.set_surface_override_material(0, material)


func toggle(receptacle_state: bool):
	if receptacle_state:
		_activated_num_fuse += 1
	else:
		_activated_num_fuse -= 1
	
	var old_state := _state
	_state = _is_active()

	tween = get_tree().create_tween()
	if _state and global_position != target:
		tween.tween_property(self, "global_position", target, 1)
	elif !_state and global_position != initial:
		tween.tween_property(self, "global_position", initial, 1)
	tween.set_trans(tween.TRANS_SINE)

	tween.play()

	if old_state != _state:
		sfx.play()


func _is_active() -> bool:
	return _activated_num_fuse == required_num_fuse
