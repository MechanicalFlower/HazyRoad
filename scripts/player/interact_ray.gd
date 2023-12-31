class_name InteractRay
extends RayCast3D

@onready var icon: TextureRect = get_node(^"TextureRect")


func _ready():
	add_exception(owner)


func _physics_process(_delta):
	if GameState.state == GameState.State.INTERACT:
		if is_colliding():
			var detected = get_collider()
			if detected is Item and detected.is_interactable():
				icon.set_texture(detected.icon)

				if Input.is_action_just_pressed(&"interact"):
					detected.interact()
					if detected is Accessory:
						icon.set_texture(null)
		else:
			icon.set_texture(null)
	else:
		icon.set_texture(null)
