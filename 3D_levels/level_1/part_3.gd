extends Node3D

@onready var part_3_con: AnimationPlayer = $part3con
var done = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if done:
		part_3_con.play("new_animation")


func _on_part_3_fall_animation_finished(anim_name: StringName) -> void:
	done = true
	part_3_con.play("new_animation")
