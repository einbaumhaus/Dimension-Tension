extends Area3D

var eliminated = 0
func enemy_gone():
	eliminated += 1

func _on_body_entered(body: Node3D) -> void:
	if body.name == "launch_player" and eliminated == 4:
		get_tree().change_scene_to_file.call_deferred("res://3D_levels/level_2/lvl_stages/level_2_3d_2.tscn")
