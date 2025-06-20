extends Node

@onready var animation_player: AnimationPlayer = $part1/part1player
@onready var part_2_player: AnimationPlayer = $part2/part2player
@onready var part_3_player: AnimationPlayer = $part3/part3player
@onready var part_4_player: AnimationPlayer = $part1/part4player
@onready var part_5_player: AnimationPlayer = $part3/part5player
@onready var part_6_player: AnimationPlayer = $part1/part6player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("intro")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	MusicPlayer.tonband2()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_part_1_player_animation_finished(anim_name: StringName) -> void:
	part_2_player.play("part2")


func _on_part_2_player_animation_finished(anim_name: StringName) -> void:
	part_3_player.play("part3")


func _on_part_3_player_animation_finished(anim_name: StringName) -> void:
	part_4_player.play("part4")


func _on_part_4_player_animation_finished(anim_name: StringName) -> void:
	part_5_player.play("part5")


func _on_part_5_player_animation_finished(anim_name: StringName) -> void:
	part_6_player.play("part6")


func _on_part_6_player_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://2D_levels/level_1/level_1_2d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
