extends Node3D

@onready var part_2_continuous: AnimationPlayer = $part2continuous
@onready var part_3_fall: AnimationPlayer = $"../part3/part3fall"

var done = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if done:
		part_2_continuous.play("new_animation")


func _on_part_2_fall_animation_finished(anim_name: StringName) -> void:
	done = true
	part_3_fall.play("new_animation")
