class_name Item
extends Node3D

@export var identifier: String
@export var icon: Texture

# Allow the item to be interactable with the Player
# If disable, no icon and no dialogue will be display
var _is_interactable: bool = true


func _ready():
	if identifier.is_empty():
		printerr(self, " 'identifier' must be set")
	if not is_instance_valid(icon):
		printerr(self, " 'icon' must be set")
	if not has_method("interact"):
		printerr(self, " 'interact' not implemented")


func _process(_delta):
	pass


func is_interactable() -> bool:
	return _is_interactable
