extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_b_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/mode_select.tscn")


func _on_lvl_1_2d_pressed() -> void:
	get_tree().change_scene_to_file("res://2D_levels/level_1/level_1.tscn")
