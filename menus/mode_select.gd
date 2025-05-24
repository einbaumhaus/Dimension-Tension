extends Control

@onready var main_menu: Control = $"../main_menu"
@onready var level_select: Control = $"../level_select"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_select_b_pressed() -> void:
	visible = false
	level_select.visible = true


func _on_back_b_pressed() -> void:
	visible = false
	main_menu.visible = true


func _on_storymode_b_pressed() -> void:
	get_tree().change_scene_to_file("res://mixed_levels/intro/intro_level.tscn")
