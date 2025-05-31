extends Node3D

@onready var launch_player: CharacterBody3D = $launch_player
@onready var launcher2 = $launch_player/Camera3D/sticker_launcher2
@onready var intro_anim: AnimationPlayer = $intro/intro_anim
@onready var enemies_wave_1: Node3D = $enemies_wave1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Global.storymode:
		intro_anim.play("intro")
	else:
		intro_anim.play("skip")
		start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_intro_anim_animation_finished(anim_name: StringName) -> void:
	start()

func start():
	launcher2.visible = true
	launch_player.second_launcher = true
	launch_player.process_mode = Node.PROCESS_MODE_PAUSABLE
	enemies_wave_1.process_mode = Node.PROCESS_MODE_PAUSABLE
