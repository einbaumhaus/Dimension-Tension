extends CharacterBody2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var double_jump = false

func jump():
	velocity.y = JUMP_VELOCITY
	
func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x += x

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() or Input.is_action_just_pressed("up") and is_on_floor() and double_jump == false:
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	var acceleration := SPEED * delta * 8
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	
	if Input.is_action_just_pressed("ui_down"):
		camera_2d.zoom = Vector2(0.5,0.5)
	state_machine()
	move_and_slide()


func _on_double_jump_body_entered(body: Node2D) -> void:
	pass

func state_machine():
	if velocity.x <= 0:
		anim.play("left")
	if velocity.x >= 0:
		anim.play("right")
