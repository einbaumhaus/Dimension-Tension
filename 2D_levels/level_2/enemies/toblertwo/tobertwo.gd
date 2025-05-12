extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 40
const PUSH_DISTANCE = 150
const PUSH_FORCE = 300

var health = 6

func _physics_process(delta: float) -> void:
	var to_player = player.global_position - global_position
	var distance = to_player.length()
	if distance < PUSH_DISTANCE:
		# Push enemy away from player
		velocity = (-to_player.normalized()) * PUSH_FORCE
		player.take_damage()
		
	elif distance < 500:
		# Move toward player normally
		velocity = to_player.normalized() * SPEED
	else:
		velocity = Vector2.ZERO
	change_animation()
	move_and_slide()

func take_damage():
	health -= 1
	if health <= 0:
		queue_free()


func change_animation():
	if health == 6:
		anim.play("default")
	if health == 5:
		anim.play("5")
	if health == 4:
		anim.play("4")
	if health == 3:
		anim.play("3")
	if health == 2:
		anim.play("2")
	if health == 1:
		anim.play("1")
