@tool
extends Node3D

@export var material: Material


func _ready():
	if material:
		apply_material(self)


func apply_material(parent: Node):
	if parent is MeshInstance3D:
		parent.set_material_override(material)

	for child in parent.get_children():
		apply_material(child)
