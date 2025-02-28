extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug(
		"godot-extended-libraries/godot-debug-menu",
		{"commit": "0e5f15217285c76170039c9cefcf79c8ab0ec6b3", "renovate-branch": "master"}
	)
	plug(
		"KoBeWi/Godot-Universal-Fade",
		{"commit": "f091514bba652880f81c5bc8809e0ee4498988ea", "renovate-branch": "master"}
	)
	plug(
		"miskatonicstudio/goat",
		{
			"commit": "49b21c138b0f535e9e3d1c2ded3ecefbf263e42a",
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
			"commit": "81321a2cc69943242ad6490a7a5767174e04f471",
			"renovate-branch": "master",
			"include": ["addons/kanban_tasks"]
		}
	)
	plug(
		"quiver-dev/quiver-analytics-godot-plugin",
		{
			"commit": "a19568f29853efee39338d63712a7da44342b359",
			"renovate-branch": "main",
		}
	)
	plug(
		"https://github.com/ItsKorin/Godot-Post-Process-Plugin",
		{"commit": "20e94f35306879ee7943298fafcc2edbb3fd41c2", "renovate-branch": "main"}
	)

	# Patched version
	plug(
		"florianvazelle/EasyMenus",
		{"commit": "018ab39001f862abbd6ca424258a9a548589d61c", "renovate-branch": "master"}
	)
	plug(
		"florianvazelle/scatter",
		{"commit": "7153347961ef265b804b61869e36e63d155bf9c4", "renovate-branch": "v4"}
	)
	plug(
		"florianvazelle/Dialogue-Label",
		{"commit": "f47547f8c06f8ba635de8ada638cfc9e5493c963", "renovate-branch": "main"}
	)
