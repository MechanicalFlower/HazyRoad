class_name FuseBox
extends Receptacle

enum ScopedColor { YELLOW, BLUE, RED, GREEN }

@export var color: ScopedColor

@onready var sfx := get_node(^"PickupSFX")
@onready var mesh: MeshInstance3D = get_node(
	^"ControlBox/ControlBoxMesh/ControlBox_1/ControlBoxCircuit_1/ControlBoxSwitch_1"
)
@onready var fuse_box: Node3D = get_node(^"FuseMesh")
@onready var light: OmniLight3D = get_node(^"OmniLight3D")


func _ready():
	# gdlint:ignore = private-method-call
	super._ready()

	var material = mesh.get_active_material(0)
	material.set_emission_energy_multiplier(1)
	light.light_energy = 0.1

	if material is BaseMaterial3D:
		match color:
			ScopedColor.YELLOW:
				material.set_emission(Color.YELLOW)
				light.set_color(Color.YELLOW)
				# Activate yellow FuseBox by default
				_state = true
				GlobalSignal.trigger_signal(signal_name, [_state])
				fuse_box.set_visible(_state)

				material.set_emission_energy_multiplier(16)
				light.light_energy = 1.0
			ScopedColor.RED:
				material.set_emission(Color.RED)
				light.set_color(Color.RED)
			ScopedColor.BLUE:
				material.set_emission(Color.BLUE)
				light.set_color(Color.BLUE)
			ScopedColor.GREEN:
				material.set_emission(Color.GREEN)
				light.set_color(Color.GREEN)
	mesh.set_surface_override_material(0, material)


func _process(_delta) -> void:
	# Avoid softlock
	if _current_item == &"crowbar" or _current_item == &"tire":
		_is_interactable = false
	else:
		_is_interactable = true


func interact():
	# If player as a fuse in his hand
	if _current_item == item_to_interact:
		# But the fuxe_box is already activated
		if _state:
			# Do nothing
			return
		# gdlint:ignore = no-else-return
		else:
			# TODO : add a visual feedback, for example: a light like a button

			# Otherwise, active the fuse_box
			_state = true
			GlobalSignal.trigger_signal(signal_name, [_state])

			# And drop the fuse from the player's hand
			sfx.play()
			GlobalSignal.trigger_signal(&"current_item_updated", [""])
			fuse_box.set_visible(_state)

			var material = mesh.get_active_material(0)
			material.set_emission_energy_multiplier(16)
			mesh.set_surface_override_material(0, material)
			light.light_energy = 1.0
	else:
		# Otherwise, if the fuse_box contains a fuse
		if _state:
			# Deactivate the fuse_box
			_state = false
			GlobalSignal.trigger_signal(signal_name, [_state])

			# And give the fuse to the player
			var material = mesh.get_active_material(0)
			material.set_emission_energy_multiplier(1)
			mesh.set_surface_override_material(0, material)
			light.light_energy = 0.1

			fuse_box.set_visible(_state)
			sfx.play()
			GlobalSignal.trigger_signal(&"current_item_updated", [&"fuse"])
		else:
			if not translation_keys.is_empty():
				dialogue.start_dialogue(translation_keys)
