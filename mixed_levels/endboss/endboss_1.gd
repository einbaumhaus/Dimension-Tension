extends Node3D

@onready var animation_player: AnimationPlayer = $intro/AnimationPlayer
@onready var player: CharacterBody3D = $Player
@onready var anim_2: AnimationPlayer = $intro/intro2/anim2
@onready var path_3d: Path3D = $Path3D
@onready var mission: CanvasLayer = $mission
@onready var bossbar: CanvasLayer = $bossbar
@onready var intro: Node3D = $intro

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Global.storymode:
		animation_player.play("intro")
		player.process_mode = Node.PROCESS_MODE_DISABLED
		player.visible = false
		path_3d.visible = false
		path_3d.process_mode = Node.PROCESS_MODE_DISABLED
		mission.visible = false
		bossbar.visible = false
	else:
		intro.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	anim_2.play("intro2")


func _on_anim_2_animation_finished(anim_name: StringName) -> void:
	player.process_mode = Node.PROCESS_MODE_PAUSABLE
	player.visible = true
	path_3d.visible = true
	path_3d.process_mode = Node.PROCESS_MODE_PAUSABLE
	mission.visible = true
	bossbar.visible = true
	intro.visible = false
	
