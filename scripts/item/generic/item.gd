class_name Item
extends Node3D

@export var identifier: String
@export var icon: Texture

# Allow the item to be interactable with the Player
# If disable, no icon and no dialogue will be display
var _is_interactable: bool = true


func _ready():
	if identifier.is_empty():
		Log.warn("%s 'identifier' must be set" % str(self))
	if not is_instance_valid(icon):
		Log.warn("%s 'icon' must be set" % str(self))
	if not has_method("interact"):
		Log.warn("%s 'interact' not implemented" % str(self))


func _process(_delta):
	pass


func is_interactable() -> bool:
	return _is_interactable
