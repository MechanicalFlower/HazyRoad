extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug(
		"godot-extended-libraries/godot-debug-menu",
		{"commit": "9d36ea23661d095198ff7fcfff2715172f73c983", "renovate-branch": "master"}
	)
	plug(
		"KoBeWi/Godot-Universal-Fade",
		{"commit": "f091514bba652880f81c5bc8809e0ee4498988ea", "renovate-branch": "master"}
	)
	plug(
		"miskatonicstudio/goat",
		{
			"commit": "b10f26a07b4ffb283a53632f31d529f38c688082",
			"renovate-branch": "master",
			"include": ["addons/goat/images"]
		}
	)
	plug(
		"samclee/EZ-Sfx-and-Music",
		{"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359", "renovate-branch": "main"}
	)
	plug(
		"HolonProduction/godot_kanban_tasks",
		{
			"commit": "cfc914caa1dabd085024ff196bcb8578eaee1e67",
			"renovate-branch": "master",
			"include": ["addons/kanban_tasks"]
		}
	)

	# Patched version
	plug(
		"florianvazelle/EasyMenus",
		{"commit": "018ab39001f862abbd6ca424258a9a548589d61c", "renovate-branch": "master"}
	)
	plug(
		"florianvazelle/scatter",
		{"commit": "d1133ab81351907624a8eff48fc064a92ffeb316", "renovate-branch": "v4"}
	)
	plug(
		"florianvazelle/Log",
		{"commit": "51878aa55c4169f19b2c000f0e53b77439654829", "renovate-branch": "main"}
	)
	plug(
		"florianvazelle/Dialogue-Label",
		{"commit": "1f394f219f8abe417588964b424767f4ab42c525", "renovate-branch": "main"}
	)
