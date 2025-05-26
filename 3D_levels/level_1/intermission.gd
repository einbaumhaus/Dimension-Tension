extends Node3D

@onready var logbreak: AnimationPlayer = $logbreak
@onready var player: CharacterBody3D = $"../Player"
@onready var part_1_continuos: AnimationPlayer = $moving_platforms/part1/part1continuos

@export var play_shake = false
@export var in_move_mode = false
@export var camera : Camera3D

@onready var part_2_fall: AnimationPlayer = $moving_platforms/part2/part2fall
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play_shake:
		camera.shake_camera(1, 0.06)
	anim_manager()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		player.visible = false
		player.process_mode = Node.PROCESS_MODE_DISABLED
		logbreak.play("logbreak")


func _on_logbreak_animation_finished(anim_name: StringName) -> void:
	player.visible = true
	player.process_mode = Node.PROCESS_MODE_ALWAYS
	in_move_mode = true
	part_2_fall.play("new_animation")

func anim_manager():
	if in_move_mode:
		part_1_continuos.play("new_animation")
