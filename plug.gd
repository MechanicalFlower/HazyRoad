extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug(
		"godot-extended-libraries/godot-debug-menu",
		{"commit": "9d36ea23661d095198ff7fcfff2715172f73c983"}
	)
	plug("night-glider/Dialogue-Label", {"commit": "a211f35e4e4c255de1b640af14430ff675e31e5c"})
	plug("KoBeWi/Godot-Universal-Fade", {"commit": "f091514bba652880f81c5bc8809e0ee4498988ea"})
	plug(
		"miskatonicstudio/goat",
		{"commit": "b10f26a07b4ffb283a53632f31d529f38c688082", "include": ["addons/goat/images"]}
	)
	plug("samclee/EZ-Sfx-and-Music", {"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359"})
	plug(
		"HolonProduction/godot_kanban_tasks",
		{"commit": "cfc914caa1dabd085024ff196bcb8578eaee1e67", "include": ["addons/kanban_tasks"]}
	)

	# Patched version
	plug("florianvazelle/EasyMenus", {"commit": "4d960ef6ab9f51a206e2eb40c2cc0b8f8eced71a"})
	plug("florianvazelle/scatter", {"commit": "ad0241d3a9d04e07158a43b732c376ad6c5760fe"})
	plug("florianvazelle/Log", {"commit": "51878aa55c4169f19b2c000f0e53b77439654829"})
