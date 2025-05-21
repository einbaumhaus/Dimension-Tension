extends Node

@onready var animation_player: AnimationPlayer = $part1/part1player
@onready var part_2_player: AnimationPlayer = $part2/part2player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("intro")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_part_1_player_animation_finished(anim_name: StringName) -> void:
	part_2_player.play("part2")
