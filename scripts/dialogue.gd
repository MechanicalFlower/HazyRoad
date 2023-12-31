class_name Dialogue
extends Control

var _old_game_state: GameState.State = GameState.State.UNKNOWN

@onready var dialogue_label: DialogueLabel = get_node(^"%DialogueLabel")


func _ready():
	set_process(false)
	hide()


func _process(_delta):
	if GameState.state == GameState.State.DIALOGUE:
		if Input.is_action_just_pressed(&"ui_accept"):
			if dialogue_label.active:
				dialogue_label.next_message()

			if !dialogue_label.active:
				set_process(false)
				hide()
				GameState.state = _old_game_state

		if Input.is_action_just_pressed(&"ui_cancel"):
			dialogue_label.skip_message()


func start_dialogue(translation_keys: Array[String]):
	dialogue_label.messages = []
	for key in translation_keys:
		if key.is_empty():
			continue
		dialogue_label.messages.append(tr(key))

	_old_game_state = GameState.state
	GameState.state = GameState.State.DIALOGUE
	show()
	set_process(true)
	dialogue_label.start_dialogue()
