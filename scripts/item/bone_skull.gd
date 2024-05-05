extends MeshInstance3D

var _triggered := false

@onready var halo := get_node(^"../Halo") as Sprite3D
@onready var area := get_node(^"../Area3D") as Area3D
@onready var sfx := get_node(^"../PickupSFX") as AudioStreamPlayer


func _ready():
	area.connect("body_entered", _on_BoneSkull_body_entered)


func _process(delta):
	rotate_y(delta)


func _on_BoneSkull_body_entered(_body):
	if not _triggered:
		_triggered = true
		GameState.collectable_founded += 1
		sfx.play()


func _on_pickup_sfx_finished():
	get_parent().queue_free()
