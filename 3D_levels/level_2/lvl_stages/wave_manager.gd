extends Node
@onready var enemies_wave_2: Node3D = $"../enemies_wave2"
@onready var wave_2_start: AnimationPlayer = $wave2_start
@onready var timer: Timer = $Timer
@onready var launch_player: CharacterBody3D = $"../launch_player"
@onready var mission: CanvasLayer = $"../mission"
@onready var animation_player: AnimationPlayer = $"../outro/AnimationPlayer"
@onready var elim_scene_2: CanvasLayer = $"../elim_scene2"

var eliminations = 0
var wave1 = true
var wave2 = false
var wave3 = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if eliminations == 9 and wave1:
		print("wave2start")
		wave1 = false
		timer.start()
	if eliminations == 10 and wave2:
		print("wave2done, next level")
		wave2 = false
		wave3 = true
	if wave3:
		animation_player.play("outro")
		wave3 = false
		launch_player.visible = false
		launch_player.process_mode = Node.PROCESS_MODE_DISABLED

func _on_timer_timeout():
	wave_2_start.play("wave2start")
	enemies_wave_2.visible = true
	launch_player.visible = false

func enemy_killed():
	eliminations += 1


func _on_wave_2_start_animation_finished(anim_name: StringName) -> void:
	launch_player.visible = true
	wave2 = true
	eliminations = 0
	enemies_wave_2.process_mode = Node.PROCESS_MODE_PAUSABLE

func start_w2():
	enemies_wave_2.reset_enemies()
	enemies_wave_2.process_mode = Node.PROCESS_MODE_DISABLED
	wave_2_start.play("wave2start")
	eliminations = 0
	launch_player.health = 100
	mission.visible = true
	print("restarting")
	wave2 = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://2D_levels/level_3/lvl_3_2d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
