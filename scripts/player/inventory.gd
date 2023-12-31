extends Node3D

@onready var crowbar: Node3D = get_node("CrowbarMesh")
@onready var flashlight: Node3D = get_node("FlashlightMesh")
@onready var fuse: Node3D = get_node("FuseMesh")
@onready var tire: Node3D = get_node("TireMesh")


func _ready():
	GlobalSignal.add_listener(&"current_item_updated", _on_Accessory_current_item_updated)
	hide_all()


func _on_Accessory_current_item_updated(new_current_item: StringName):
	hide_all()
	match new_current_item:
		&"crowbar":
			crowbar.show()
		&"flashlight":
			flashlight.show()
		&"fuse":
			fuse.show()
		&"tire":
			tire.show()


func hide_all():
	crowbar.hide()
	flashlight.hide()
	fuse.hide()
	tire.hide()
