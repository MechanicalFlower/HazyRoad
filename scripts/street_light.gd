class_name StreetLight
extends Node3D

const GlowMaterial := preload("res://resources/materials/glow.tres")
const GlowDisabledMaterial := preload("res://resources/materials/glow_disabled.tres")

var _activated_num_fuse: int = 0

@onready var street_light: MeshInstance3D = get_node(^"./StreetLightMesh")
@onready var spot_light: SpotLight3D = get_node(^"./StreetLightMesh/SpotLight3D")


func _ready():
	spot_light.hide()

	GlobalSignal.add_listener(&"fuse_box_green_state_updated", _on_FuseBox_state_updated)


func _on_FuseBox_state_updated(receptacle_state: bool):
	if receptacle_state:
		_activated_num_fuse += 1
	else:
		_activated_num_fuse -= 1

	if _is_active():
		spot_light.show()
		street_light.set_surface_override_material(1, GlowMaterial)

	else:
		spot_light.hide()
		street_light.set_surface_override_material(1, GlowDisabledMaterial)


func _is_active() -> bool:
	return _activated_num_fuse == 2
