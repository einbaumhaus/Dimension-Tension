extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mat = get_active_material(0)
	mat.uv1_offset += Vector3(0,0.2,0)*delta


func _on_boundary_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene.call_deferred()


func _on_secret_boundary_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file.call_deferred("res://3D_levels/level1_ocean/easter_egg1.tscn")
