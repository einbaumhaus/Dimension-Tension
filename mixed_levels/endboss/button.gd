extends StaticBody3D
var inside: bool = false
var playing: bool = false
var going_forward: bool = true
@onready var anim: AnimationPlayer = $anim
@onready var train_pop_up: Node3D = $"../train_pop_up"

func _process(delta: float) -> void:
	if inside and not playing:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("e"):
			playing = true
			going_forward = true
			anim.play("press")
			print("Pressed")
			train_pop_up.pop_up()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":  # Optional filter
		inside = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		inside = false

func _on_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "press":
		if going_forward:
			# Finished forward, now reverse
			going_forward = false
			anim.play_backwards("press")
		else:
			# Finished backward — allow next press
			playing = false
