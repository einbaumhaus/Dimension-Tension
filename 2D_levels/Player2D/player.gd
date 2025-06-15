extends CharacterBody2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstep: AudioStreamPlayer = $PlayerAudio/footstep
@onready var footstep_audio: AnimationPlayer = $PlayerAudio/footstep_audio

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#coyote time so the player can still jump when going down steep parts
var coyote_time := 0.2
var coyote_timer := 0.0

var pointing_right = true
	
func jump():
	velocity.y = JUMP_VELOCITY
	
func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x += x

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		coyote_timer = coyote_time
	else:
		coyote_timer -= delta
	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("up")) and coyote_timer > 0.0:
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	var acceleration := SPEED * delta * 8
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	
	if velocity != Vector2() and is_on_floor():
		footstep_audio.play("walking", -1, 1.5)
	
	#if Input.is_action_just_pressed("ui_down"):
		#camera_2d.zoom = Vector2(0.5,0.5)
	state_machine()
	move_and_slide()

func play_footstep():
	footstep.pitch_scale = randf_range(0.8, 1.2)
	footstep.play()

func state_machine():
	if velocity.x < 0:
		anim.play("left")
		pointing_right = false
	elif velocity.x > 0:
		anim.play("right")
		pointing_right = true
	elif velocity.x == 0:
		if pointing_right:
			anim.play("still_right")
		else:
			anim.play("still_left")
