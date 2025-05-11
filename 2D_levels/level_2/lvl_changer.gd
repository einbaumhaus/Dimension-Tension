extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player_topdown":
		get_tree().change_scene_to_file("res://2D_levels/level_2/lvl_2_2.tscn")
