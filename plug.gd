extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug("godot-extended-libraries/godot-debug-menu", {"commit": "9d36ea23661d095198ff7fcfff2715172f73c983"})
	plug("night-glider/Dialogue-Label", {"commit": "a211f35e4e4c255de1b640af14430ff675e31e5c"})
	plug("KoBeWi/Godot-Universal-Fade", {"commit": "f091514bba652880f81c5bc8809e0ee4498988ea"})
	plug("HungryProton/scatter", {"commit": "9cbdd801f4ef6c77140e84ed9b0d96df2c6c5bb1"})
	plug("miskatonicstudio/goat", {
			"commit": "b10f26a07b4ffb283a53632f31d529f38c688082",
			"include": ["addons/goat/images"]
		}
	)
	plug("samclee/EZ-Sfx-and-Music", {"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359"})
	plug("HolonProduction/godot_kanban_tasks", {
		"commit": "cfc914caa1dabd085024ff196bcb8578eaee1e67",
		"include": ["addons/kanban_tasks"]
	})

	# Patched version
	plug("florianvazelle/EasyMenus", {"commit": "3b8602985191f6a128808068d250b5b336d05379"})
