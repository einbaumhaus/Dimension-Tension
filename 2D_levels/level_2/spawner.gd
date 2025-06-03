extends CharacterBody2D
@onready var progress_bar: ProgressBar = $ProgressBar
@export var health = 10
var enemy_scene = preload("res://2D_levels/level_2/enemies/toblertwo/tobertwo.tscn")
@onready var marker_2d: Marker2D = $Marker2D
var spawned = 0
@onready var spawn_limit: Timer = $spawn_limit

var spawner_on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.value = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if progress_bar.value == 0:
		queue_free()
	if spawned >= 5:
		spawner_on = false

func take_damage():
	progress_bar.value -= 1


func _on_spawn_timer_timeout() -> void:
	if spawner_on:
		var enemy = enemy_scene.instantiate()
		enemy.global_position = marker_2d.global_position
		get_parent().add_child(enemy)
		spawned += 1


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "player_topdown":
		spawner_on = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.name == "player_topdown":
		spawner_on = false


func _on_spawn_limit_timeout() -> void:
	spawned = 0
	spawner_on = true
