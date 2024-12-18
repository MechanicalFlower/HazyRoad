class_name Mechanism
extends Observable

@export var receptacle: String

@onready var signal_name: StringName = receptacle + "_state_updated"


func _ready():
	# gdlint:ignore = private-method-call
	super._ready()

	if receptacle.is_empty():
		push_warning("[Mechanism] %s 'receptacle' must be set" % str(self))
	if not has_method("toggle"):
		push_warning("[Mechanism] %s 'toggle' not implemented" % str(self))

	GlobalSignal.add_listener(signal_name, _on_Receptacle_state_updated)


func _on_Receptacle_state_updated(receptacle_state: bool):
	# TODO : faire un feedback sonore
	if has_method("toggle"):
		callv("toggle", [receptacle_state])
