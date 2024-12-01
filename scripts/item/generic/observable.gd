class_name Observable
extends Item

const DialogueScene: PackedScene = preload("res://scenes/dialogue.tscn")

@export_multiline var translation_keys: Array[String] = []

@onready var dialogue: Dialogue = DialogueScene.instantiate()


func _ready():
	icon = preload("res://addons/goat/images/eye_icon.png")

	# gdlint:ignore = private-method-call
	super._ready()

	if translation_keys.is_empty():
		push_warning("[Observable] %s 'translation_keys' must be set" % str(self))

	call_deferred("add_child", dialogue)


func interact():
	if not translation_keys.is_empty():
		dialogue.start_dialogue(translation_keys)
