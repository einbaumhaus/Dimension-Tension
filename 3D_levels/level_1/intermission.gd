extends Node3D

@onready var logbreak: AnimationPlayer = $logbreak
@onready var player: CharacterBody3D = $"../Player"
@onready var sunkenwood: AnimationPlayer = $sunkenwood

@export var play_shake = false
@export var in_move_mode = false
@export var camera : Camera3D
@onready var player_holder: AnimationPlayer = $player_holder


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if play_shake:
		camera.shake_camera(1, 0.06)
	if in_move_mode:
		sunkenwood.play("floating")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		player.visible = false
		player.process_mode = Node.PROCESS_MODE_DISABLED
		logbreak.play("logbreak")

func _on_logbreak_animation_finished(anim_name: StringName) -> void:
	player.visible = true
	player.process_mode = Node.PROCESS_MODE_PAUSABLE
	in_move_mode = true
	player_holder.play("new_animation")
