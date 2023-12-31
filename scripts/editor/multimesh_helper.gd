# Add a scene to all mesh instance of a multimesh
static func add_scene_to_mesh_by_multimesh(
	multimesh_instance: MultiMeshInstance3D, packed_scene: PackedScene
) -> void:
#	multimesh_instance.multimesh.set_visible_instance_count(200)
	for index in multimesh_instance.multimesh.instance_count:
		var trans := multimesh_instance.multimesh.get_instance_transform(index) as Transform3D
		var scene := packed_scene.instance() as Node3D
		scene.transform = trans
		multimesh_instance.add_child(scene)
