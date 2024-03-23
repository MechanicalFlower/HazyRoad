@tool
extends EditorPlugin


func _enter_tree():
	if not ProjectSettings.has_setting("addons/release_checker/repo_url"):
		ProjectSettings.set_setting("addons/release_checker/repo_url", "")
