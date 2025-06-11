extends Button



func _on_pressed() -> void:
	Global.next_scene = "res://3D_levels/level_1/level_1_3d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
