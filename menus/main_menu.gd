extends Control
@onready var mode_select: Control = $"../mode_select"

@onready var level_select: Control = $"../level_select"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://mixed_levels/end/end_credit_level.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_play_pressed() -> void:
	visible = false
	mode_select.visible = true
