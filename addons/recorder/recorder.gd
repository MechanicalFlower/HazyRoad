@tool
extends Node
## Node that adds a frame mode to record frames on-the-run!

# Export variables
@export var frames_per_second := 15.0
## Folder to save recorded frames in.
@export var output_folder: String:
	set(value):
		output_folder = value.trim_suffix("/")

## Shortcut to start/stop recording the frames.
@export var record_shortcut: Shortcut
## Shortcut to save recorded frames.
@export var save_shortcut: Shortcut

# Intern variables
@onready var _frametick := 1.0 / frames_per_second
@onready var _images := []
@onready var _running := false
@onready var _task_id := -1
@onready var _viewport := get_viewport()
@onready var _label := Label.new()


func _ready() -> void:
	# If running on editor, DONT override process and input
	set_process(false)
	set_process_input(false)

	if not Engine.is_editor_hint():
		set_process(true)
		set_process_input(true)

		# Some recorder info to show onscreen
		get_viewport().call_deferred("add_child", _label)
		_label.set_text(
			"Waiting for capture...\nNumber of frames recorded: %s" % str(_images.size())
		)


func _input(event: InputEvent) -> void:
	if not record_shortcut or not save_shortcut:
		return

	for shortcut_event: InputEvent in record_shortcut.events:
		if shortcut_event.is_match(event):
			get_viewport().set_input_as_handled()

			if event.is_pressed() and not event.is_echo():
				start_recording()

	if not _running:
		for shortcut_event: InputEvent in save_shortcut.events:
			if shortcut_event.is_match(event):
				get_viewport().set_input_as_handled()

				if event.is_pressed() and not event.is_echo():
					save_frames()


func _process(delta: float) -> void:
	if _running:
		_frametick += delta
		if _frametick > 1.0 / frames_per_second:
			_frametick -= 1.0 / frames_per_second

			# Retrieve viewport texture
			var image: Image = get_viewport().get_texture().get_image()
			_images.append(image)

	else:
		if _task_id != -1 and WorkerThreadPool.is_group_task_completed(_task_id):
			_label.set_text("Done! Check the '%s' folder on your project." % output_folder)
			_images.clear()
			_task_id = -1


func start_recording() -> void:
	if not _running:
		_label.hide()
		_images.clear()

	_running = !_running

	if not _running:  # It was running before
		_label.show()
		_label.set_text(
			"Waiting for capture...\nNumber of frames recorded: %s" % str(_images.size())
		)


func save_frames() -> void:
	var dir = DirAccess.open("res://")
	if dir.make_dir_recursive(output_folder) != OK:
		_label.set_text("An error occurred when trying to create the '%s' folder." % output_folder)
		return

	# Prevent the images from being imported into the editor
	var file = FileAccess.open("res://%s/.gdignore" % output_folder, FileAccess.WRITE)
	file.close()

	var num_img_by_thrd := 5
	_task_id = (
		WorkerThreadPool
		. add_group_task(
			save_frame.bind(num_img_by_thrd),
			ceili(_images.size() / float(num_img_by_thrd)),
		)
	)


func save_frame(i: int, len: int) -> void:
	var begin := i * len
	var end: int = min(begin + len, _images.size())
	for idx in range(begin, end):
		_images[idx].save_png("res://%s/%04d.png" % [output_folder, idx])
