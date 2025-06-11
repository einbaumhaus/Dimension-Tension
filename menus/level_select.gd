extends Control

@onready var main_menu: Control = $"../main_menu"
@onready var mode_select: Control = $"../mode_select"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_b_pressed() -> void:
	visible = false
	mode_select.visible = true


func _on_lvl_1_2d_pressed() -> void:
	Global.next_scene = "res://2D_levels/level_1/level_1_2d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)


func _on_lvl_1_3d_pressed() -> void:
	Global.next_scene = "res://3D_levels/level_1/level_1_3d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)


func _on_lvl_2_3d_pressed() -> void:
	Global.next_scene = "res://3D_levels/level_2/lvl_stages/level_2_3d_1.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)


func _on_lvl_2_2d_pressed() -> void:
	Global.next_scene = "res://2D_levels/level_2/lvl_2.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)



func _on_lvl_3_2d_pressed() -> void:
	Global.next_scene = "res://2D_levels/level_3/lvl_3_2d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)


func _on_lvl_3_3d_pressed() -> void:
	Global.next_scene = "res://3D_levels/level_3/level_3_3d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
