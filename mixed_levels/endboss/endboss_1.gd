extends Node3D

@onready var animation_player: AnimationPlayer = $intro/AnimationPlayer
@onready var player: CharacterBody3D = $Player
@onready var anim_2: AnimationPlayer = $intro/intro2/anim2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Global.storymode:
		animation_player.play("intro")
		player.process_mode = Node.PROCESS_MODE_DISABLED
		player.visible = false
	else:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim_2.play("intro2")


func _on_anim_2_animation_finished(anim_name: StringName) -> void:
	player.process_mode = Node.PROCESS_MODE_PAUSABLE
	player.visible = true
