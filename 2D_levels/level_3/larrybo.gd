extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
var patrolling = true
var last_position = Vector2.ZERO
@onready var path_follow: PathFollow2D = $".."
var start_pos = null

const SPEED = 150
var health = 6

func _ready() -> void:
	start_pos = global_position

func _physics_process(delta: float) -> void:
	var to_player = player.global_position - global_position
	var distance = to_player.length()
	if patrolling:
		velocity = Vector2.ZERO
	else:
		if distance < 100:
			print("attacking")
			player.take_damage()
		if distance > 500:
			patrolling = true
			velocity = Vector2.ZERO
			path_follow.progress = 0.0  #Reset patrol path to start
			global_position = start_pos
			print("patrolling again")
		elif distance < 300:
			# Move toward player normally
			velocity = to_player.normalized() * SPEED
		else:
			velocity = Vector2.ZERO
		change_facing_animation()
	move_and_slide()
	
func change_facing_animation():
	var movement = global_position - last_position
	last_position = global_position
	if movement.x > 1:
		sprite_2d.play("right_side")
	if movement.x < -1:
		sprite_2d.play("left_side")
	if movement.y > 1:
		sprite_2d.play("front")
	if movement.y < -1:
		sprite_2d.play("back")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player_topdown":
		print("chasing")
		patrolling = false
