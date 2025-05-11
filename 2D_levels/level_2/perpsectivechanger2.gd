extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player_topdown":
		get_tree().change_scene_to_file.call_deferred("res://3D_levels/level_2/lvl_stages/level_2_3d_1.tscn")
