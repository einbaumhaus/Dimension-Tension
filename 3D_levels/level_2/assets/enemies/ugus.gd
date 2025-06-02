extends CharacterBody3D
#constants
@export var SPEED = 4.0
const STOP_DISTANCE = 2
var _gravity := -30.0

#short pause if it's a lightning ullu
@export var is_lightning = false
@onready var pause_timer: Timer = $PauseTimer
var old_speed = 0

@export var health = 5
@export var material: Material
#damage
@export var DAMAGE = 10
const ATTACK_INTERVAL = 1.0 # seconds between attacks
var attack_timer := 0.0
const ATTACK_RANGE = 2.5
@onready var foot_top: MeshInstance3D = $head/foot_top
@onready var foot_bottom: MeshInstance3D = $foot/foot_bottom

@onready var main_body: MeshInstance3D = $main_body

@onready var wave_manager: Node = get_node_or_null("../../wave_manager")

func _ready() -> void:
	var hitbox = $Launch_col
	hitbox.connect("body_part_hit", Callable(self, "hit"))
	if material:
		main_body.set_surface_override_material(0, material.duplicate())
		foot_top.set_surface_override_material(0, material.duplicate())
		foot_bottom.set_surface_override_material(0, material.duplicate())
func _physics_process(delta: float) -> void:
	#check for player
	var players = get_tree().get_nodes_in_group("player")
	if players.size() == 0:
		return  # No player found
	var player = players[0]
	var enemy_pos = global_transform.origin
	var player_pos = player.global_transform.origin
	var distance = enemy_pos.distance_to(player_pos)
	var direction = (Global.player_current_pos - global_position)
	if global_transform.origin.distance_to(player_pos) > STOP_DISTANCE and is_on_floor():
		direction = direction.normalized()
		velocity = direction * SPEED
	
	#looking
	player_pos.y = enemy_pos.y
	$head.look_at(player_pos, Vector3.UP)
	$foot.look_at(player_pos, Vector3.UP)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	
	move_and_slide()
	if distance <= ATTACK_RANGE:
		if $AttackTimer.is_stopped():
			# Immediate attack
			if player.has_method("take_damage"):
				player.take_damage(DAMAGE)
				print("Immediate attack!")
				if is_lightning:
					pause_timer.start()
					old_speed = SPEED
					SPEED = 0
			$AttackTimer.start()  # Start timer for repeated attacks
	else:
		if not $AttackTimer.is_stopped():
			$AttackTimer.stop()

func hit(damage: int) -> void:
	health -= damage
	print(name, " was hit! Health:", health)
	var mat = main_body.get_active_material(0)
	mat.albedo_color += Color(0.3, 0, 0, 0)
	if health <= 0:
		if wave_manager != null:
			wave_manager.enemy_killed()
		queue_free()


func _on_attack_timer_timeout() -> void:
	var player = get_tree().get_nodes_in_group("player")
	if player.is_empty():
		return

	var player_node = player[0]
	var distance = global_position.distance_to(player_node.global_position)
	
	if distance <= ATTACK_RANGE:
		print("Timer attack! Enemy attacking.")
		if player_node.has_method("take_damage"):
			player_node.take_damage(DAMAGE)


func _on_pause_timer_timeout() -> void:
	SPEED = old_speed
