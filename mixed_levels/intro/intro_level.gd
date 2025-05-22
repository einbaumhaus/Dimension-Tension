extends Node

@onready var animation_player: AnimationPlayer = $part1/part1player
@onready var part_2_player: AnimationPlayer = $part2/part2player
@onready var part_3_player: AnimationPlayer = $part3/part3player
@onready var part_4_player: AnimationPlayer = $part1/part4player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_part_1_player_animation_finished(anim_name: StringName) -> void:
	part_2_player.play("part2")


func _on_part_2_player_animation_finished(anim_name: StringName) -> void:
	part_3_player.play("part3")


func _on_part_3_player_animation_finished(anim_name: StringName) -> void:
	part_4_player.play("part4")
