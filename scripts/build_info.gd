@tool
extends Label

const BuildInfo := preload("res://addons/export-build-info/build_info.gd")


func _ready():
	var build_version = ProjectSettings.get_setting(BuildInfo.BUILD_INFO_VERSION)
	var build_commit = ProjectSettings.get_setting(BuildInfo.BUILD_INFO_COMMIT)

	if build_version and build_commit:
		set_text("v%s @ %s" % [build_version, build_commit.left(7)])
	else:
		set_text("")
