extends Node

@onready var easy_menu: Control = get_node(^"%EasyMenu")
@onready var title: Label = get_node(^"%EasyMenu/Content/Title")
@onready var music: MusicPlayer = get_node(^"%MusicPlayer")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	get_viewport().scaling_3d_scale = 0.25
	title.set_text(&"Hazy Road")
	easy_menu.connect(&"start_game_pressed", _on_Menu_start_game_pressed)
	music.play("main_menu")
	
	await Fade.fade_in(1, Color.BLACK, "Diamond", false, false).finished


func _on_Menu_start_game_pressed():
	await Fade.fade_out(1, Color.BLACK, "Diamond", false, false).finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
