class_name DarkRoad
extends Observable

@onready var player = get_tree().get_nodes_in_group(&"player")[0]


func _ready():
	# gdlint:ignore = private-method-call
	super._ready()
	GlobalSignal.add_listener(&"current_item_updated", _on_Accessory_current_item_updated)


func _process(_delta: float):
	# Increase black vignette when the player approach
	var distance_to_player = global_position.distance_to(player.global_position)
	if distance_to_player < 25:
		var vignette: ColorRect = player.get_node("Vignette/CanvasLayer/ColorRect")
		var shader: ShaderMaterial = vignette.get_material()
		shader.set_shader_parameter("alpha", lerp(1, 0, (distance_to_player - 20) / 5))


func interact():
	if not translation_keys.is_empty():
		dialogue.start_dialogue(translation_keys)


func _on_Accessory_current_item_updated(_new_current_item: StringName):
	if _new_current_item == &"flashlight":
		queue_free()
