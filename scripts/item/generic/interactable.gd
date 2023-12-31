class_name Interactable
extends Item


func _ready():
	icon = load("res://addons/goat/images/item_interaction_icon.png")

	# gdlint:ignore = private-method-call
	super._ready()
