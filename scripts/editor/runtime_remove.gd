extends Node


func _ready():
	get_parent().call_deferred("remove_child", self)
