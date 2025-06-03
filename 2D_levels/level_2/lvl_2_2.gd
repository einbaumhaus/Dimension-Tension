extends Node

@onready var intro: AnimationPlayer = $INTRO/Intro
@onready var player_topdown: CharacterBody2D = $player_topdown
@onready var spawners: Node2D = $spawners
@onready var camera_2d: Camera2D = $INTRO/Camera2D
var skip = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not skip:
		player_topdown.process_mode = Node.PROCESS_MODE_DISABLED
		spawners.process_mode = Node.PROCESS_MODE_DISABLED
		intro.play("intro")
		print("playing")
	else:
		intro.play("RESET")
		camera_2d.enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_intro_animation_finished(anim_name: StringName) -> void:
	player_topdown.process_mode = Node.PROCESS_MODE_PAUSABLE
	spawners.process_mode = Node.PROCESS_MODE_PAUSABLE
