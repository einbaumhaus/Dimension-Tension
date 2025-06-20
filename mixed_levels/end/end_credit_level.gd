extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var animation_player_3: AnimationPlayer = $AnimationPlayer3
var playtimes = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player_2.play("drive2")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if MusicPlayer.tonband == 6:
		pass
	else:
		MusicPlayer.tonband5()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if playtimes < 5:
		animation_player_2.play("drive2")
		playtimes += 1
	else:
		animation_player_3.play("drive3")
		playtimes = 0

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	if playtimes < 5:
		animation_player.play("drive")
		playtimes += 1
	else:
		animation_player_3.play("drive3")
		playtimes = 0

func _on_animation_player_3_animation_finished(anim_name: StringName) -> void:
	animation_player.play("drive")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/menu_manager.tscn")


func _on_button_pressed() -> void:
	OS.shell_open("https://github.com/einbaumhaus/Dimension-Tension")


func _on_fragebogen_pressed() -> void:
	OS.shell_open("https://google.com")
