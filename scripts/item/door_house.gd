class_name DoorHouse
extends Receptacle

@onready var initial_rotation: Vector3 = rotation_degrees
@onready var tween: Tween
@onready var sfx := get_node(^"DoorOpenSFX")


func _ready():
	tween = get_tree().create_tween()
	tween.stop()

	_send_signal = false
	# gdlint:ignore = private-method-call
	super._ready()


func interact():
	if _state:
		# Do nothing
		return

	if _current_item == item_to_interact:
		_state = true
		_toggle()
	else:
		super.interact()


func _toggle():
	assert(_state)
	tween.tween_property(self, "rotation_degrees:y", initial_rotation.y - 79.5, 1)
	tween.set_trans(Tween.TRANS_SINE)

	sfx.play()
	tween.play()
