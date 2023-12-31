@tool
class_name MenuAnimation
extends Node

@export var radius: float = 150.0
@export var speed: float = 6.0

var _d: float = 0.0

@onready var car: Node3D = get_node(^"%Car")
@onready var camera_car: Camera3D = get_node(^"%Camera3D")


func _process(delta):
	_d += delta

	var position = Vector3(
		sin(_d * speed) * radius,
		car.position.y,
		cos(_d * speed) * radius,
	)

	var next_position = Vector3(
		sin((_d - 1) * speed) * radius,
		car.position.y,
		cos((_d - 1) * speed) * radius,
	)

	car.look_at_from_position(position, next_position)
