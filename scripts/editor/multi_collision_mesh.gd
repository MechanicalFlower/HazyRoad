@tool
extends Node3D

const MultimeshHelper = preload("res://scripts/editor/multimesh_helper.gd")

@export var scene: PackedScene
@export var multimesh_path: NodePath

@onready var multimesh_node: Node3D = get_node(multimesh_path)


func _ready():
	MultimeshHelper.add_scene_to_mesh_by_multimesh(multimesh_node, scene)
