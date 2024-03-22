class_name Scenario
extends Node

@onready var animation_player: AnimationPlayer = get_node(^"%AnimationPlayer")
@onready var camera_car: Camera3D = get_node(^"%Camera3D")
@onready var player: MovementController = get_node(^"%Player")


func _ready():
	player.set_process_mode(PROCESS_MODE_DISABLED)
	camera_car.set_current(true)

	animation_player.connect(&"animation_finished", _on_Scenario_animation_finished)
	GlobalSignal.add_listener(&"game_finished", _on_Scenario_game_finished)

	# Start the game with an intro cutscene
	Fade.fade_in(1, Color.BLACK, "Diamond", false, false)
	animation_player.play(&"intro")

	camera_car.get_parent().get_node("Engine").play()


func _on_Scenario_animation_finished(anim_name: StringName):
	if anim_name == &"intro":
		await Analytics.add_event(
			"Start the game", {"game_version": ProjectSettings.get("application/config/version")}
		)
		camera_car.get_parent().get_node("Engine").stop()

		# Transition that launch the playable game
		camera_car.set_current(false)
		player.set_process_mode(PROCESS_MODE_INHERIT)

	elif anim_name == &"outro":
		await Analytics.add_event(
			"Finish the game", {"game_version": ProjectSettings.get("application/config/version")}
		)
		await Fade.fade_out(1, Color.BLACK, "Diamond", false, false).finished
		get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_Scenario_game_finished():
	player.set_process_mode(PROCESS_MODE_DISABLED)
	camera_car.set_current(true)

	animation_player.play(&"outro")

	camera_car.get_parent().get_node("Engine").play()
