class_name Receptacle
extends Interactable

const DialogueScene: PackedScene = preload("res://scenes/dialogue.tscn")

@export var item_to_interact: String
@export_multiline var translation_keys: Array[String] = []

var _current_item: String
var _state: bool = false
var _send_signal: bool = true

@onready var dialogue: Dialogue = DialogueScene.instantiate()
@onready var signal_name: StringName = identifier + "_state_updated"


func _ready():
	# gdlint:ignore = private-method-call
	super._ready()

	if item_to_interact.is_empty():
		printerr(self, " 'item_to_interact' must be set")
	if translation_keys.is_empty():
		printerr(self, " 'translation_keys' must be set")

	call_deferred("add_child", dialogue)

	GlobalSignal.add_listener(&"current_item_updated", _on_Accessory_current_item_updated)


func interact():
	if _current_item == item_to_interact:
		_state = !_state
		if _send_signal:
			GlobalSignal.trigger_signal(signal_name, [_state])
	else:
		if not translation_keys.is_empty():
			dialogue.start_dialogue(translation_keys)


func _on_Accessory_current_item_updated(new_current_item: String):
	_current_item = new_current_item
