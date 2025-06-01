extends Node
@onready var enemies_wave_2: Node3D = $"../enemies_wave2"
@onready var wave_2_start: AnimationPlayer = $wave2_start
@onready var timer: Timer = $Timer
@onready var launch_player: CharacterBody3D = $"../launch_player"

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

func _on_timer_timeout():
	wave_2_start.play("wave2start")
	enemies_wave_2.visible = true

func enemy_killed():
	eliminations += 1


func _on_wave_2_start_animation_finished(anim_name: StringName) -> void:
	wave2 = true
	eliminations = 0
	enemies_wave_2.process_mode = Node.PROCESS_MODE_PAUSABLE

func start_w2():
	enemies_wave_2.reset_enemies()
	enemies_wave_2.process_mode = Node.PROCESS_MODE_DISABLED
	wave_2_start.play("wave2start")
	eliminations = 0
	launch_player.health = 10
	print("restarting")
	wave2 = false
