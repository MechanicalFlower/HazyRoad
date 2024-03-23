extends Control

const UpdateChecker := preload("res://addons/gh-release-checker/update_checker.gd")

@onready var link_btn: LinkButton = $LinkBtn
@onready var update_checker := UpdateChecker.new()


func _ready() -> void:
	add_child(update_checker)
	update_checker.get_latest_version()
	update_checker.release_parsed.connect(on_released_parsed)


func on_released_parsed(release: Dictionary) -> void:
	if release["new"]:
		link_btn.show()
		link_btn.text = "New version available: " + release["version"]
	else:
		link_btn.hide()
		#link_btn.text = "You have the latest version: " + release["version"]
	link_btn.uri = release["url"]
