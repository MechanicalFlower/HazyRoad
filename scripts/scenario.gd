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

	Fade.fade_in(1, Color.BLACK, "Diamond", false, false)

	GameState.playing_start_time = Time.get_unix_time_from_system()

	# Start the game with an intro cutscene
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
		var playing_time = snapped(
			(GameState.playing_end_time - GameState.playing_start_time) / 60, 0.01
		)

		var event = {
			"game_version": ProjectSettings.get("application/config/version"),
			"playing_time": playing_time,
			"collectable_founded": GameState.collectable_founded,
		}
		await Analytics.add_event("Finish the game", event)

		var outro_ui = $"../UI/Outro"
		var scores = outro_ui.get_node("CenterContainer/VBoxContainer/HBoxContainer/VBoxContainer2")
		scores.get_node("PlayingTimeScore").set_text(
			"%02d:%02d" % [playing_time / 60, fmod(playing_time, 60)]
		)
		scores.get_node("CollectableFoundedScore").set_text(
			"%s / 5" % GameState.collectable_founded
		)
		outro_ui.show()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_accept"):
		var outro_ui = $"../UI/Outro"
		if outro_ui.visible:
			await Fade.fade_out(1, Color.BLACK, "Diamond", false, false).finished
			get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_Scenario_game_finished():
	player.get_node("Head/InteractRay/TextureRect").set_texture(null)

	player.set_process_mode(PROCESS_MODE_DISABLED)
	camera_car.set_current(true)

	# End the game with an outro cutscene
	animation_player.play(&"outro")
	camera_car.get_parent().get_node("Engine").play()

	GameState.playing_end_time = Time.get_unix_time_from_system()
