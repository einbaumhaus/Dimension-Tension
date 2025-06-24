extends CharacterBody3D

@export var SPEED = 4.0
@export var health = 1000
@export var DAMAGE = 10
@export var projectile_scene: PackedScene = preload("res://mixed_levels/endboss/eb1/magic_ball.tscn")
@export var projectile_speed = 10.0
const ATTACK_INTERVAL = 1.5  # shoot every 2 seconds
const ATTACK_RANGE = 400.0    # how far he can shoot
var attack_timer := 0.0
@onready var healthbar: ProgressBar = $"../../../bossbar/healthbar"
@onready var manager: Node = $"../../../Manager"
@export var flip_health = 700

func _ready() -> void:
	$AttackTimer.wait_time = ATTACK_INTERVAL
	$AttackTimer.start()
	print("timer started")

func _physics_process(delta: float) -> void:
	if health <= flip_health:
		manager.flip()
	healthbar.value = health
	var players = get_tree().get_nodes_in_group("player")
	if players.size() == 0:
		print("no players found")
		return
	var player = players[0]
	var enemy_pos = global_transform.origin
	var player_pos = player.global_transform.origin

	# rotate to face player (but don't look up/down)
	player_pos.y = enemy_pos.y
	look_at(player_pos, Vector3.UP)
	move_and_slide()

func _on_attack_timer_timeout() -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.is_empty():
		print("no palyers")
		return

	var player = players[0]
	var to_player = (player.global_transform.origin - global_transform.origin)
	if to_player.length() > ATTACK_RANGE:
		return  # player too far

	shoot_projectile(to_player.normalized())

func shoot_projectile(direction: Vector3) -> void:
	if projectile_scene == null:
		print("No projectile scene assigned!")
		return
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_transform.origin = global_transform.origin
	if projectile.has_method("set_velocity"):
		projectile.set_velocity(direction)


func _on_launch_col_body_part_hit(dam: Variant) -> void:
	health -= dam
	print(name, " was hit! Health:", health)
	if health <= 0:
		queue_free()
