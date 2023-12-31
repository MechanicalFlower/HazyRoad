class_name Accessory
extends Interactable

@onready var sfx := get_node(^"PickupSFX")


func interact():
	hide()
	set_process_mode(PROCESS_MODE_DISABLED)
	sfx.play()
	GlobalSignal.trigger_signal(&"current_item_updated", [identifier])
