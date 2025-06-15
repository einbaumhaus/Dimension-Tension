extends Node3D

@onready var cutscene: AnimationPlayer = $cutscene
@onready var player: CharacterBody3D = $launch_player
@onready var camera: Camera3D = $Camera3D
@onready var enemies: Node3D = $enemies
@onready var lilguy: AnimatedSprite3D = $lilguy
@onready var mission: CanvasLayer = $mission

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Global.storymode == true:
		cutscene.play("intro")
		mission.visible = false
	else:
		cutscene.play("lvlSEL")
		activate()
	MusicPlayer.tonband4()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cutscene_animation_finished(anim_name: StringName) -> void:
	activate()
	lilguy.queue_free()
	camera.queue_free()

func activate():
	player.visible = true
	mission.visible = true
	player.process_mode = Node.PROCESS_MODE_INHERIT
	enemies.process_mode = Node.PROCESS_MODE_INHERIT
