class_name DarkRoad
extends Observable


func _ready():
	# gdlint:ignore = private-method-call
	super._ready()

	GlobalSignal.add_listener(&"current_item_updated", _on_Accessory_current_item_updated)


func interact():
	if not translation_keys.is_empty():
		dialogue.start_dialogue(translation_keys)


func _on_Accessory_current_item_updated(_new_current_item: StringName):
	if _new_current_item == &"flashlight":
		queue_free()
