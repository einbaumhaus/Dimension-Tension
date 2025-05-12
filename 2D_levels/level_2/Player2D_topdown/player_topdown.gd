extends CharacterBody2D

@onready var collision: CollisionShape2D = $CollisionShape2D
var sticker_scene = preload("res://2D_levels/level_2/Player2D_topdown/sticker_launcher/sticker/sticker.tscn")
var new_vel = Vector2.ZERO
const SPEED = 220
const JUMP_VELOCITY = -400.0
var facing_state = 1
#taking damage
var can_take_damage = true
var damage_cooldown = 1.0
var damage_timer = 0.0
var health = 20
#records what direction play is facing, 1=front, 2=back, 3=left, 4= right
@onready var launcher_pivot: Node2D = $launcher_pivot
@onready var sticker_launcher: AnimatedSprite2D = $launcher_pivot/sticker_launcher
@onready var anim: AnimatedSprite2D = $player

#launcher delay
var last_launch_time = 0.0
var cooldown = 0.2  # seconds between sticker launches

func _physics_process(delta: float) -> void:
	launcher_rotation()
	state_machine()
	#movement logic
	velocity.x = Input.get_axis("left", "right")
	velocity.y = Input.get_axis("up", "down")
	velocity = velocity.normalized()*SPEED

	#launcher logic
	if Input.is_action_pressed("left_click") or Input.is_action_pressed("ui_accept"):
		var current_time = Time.get_ticks_msec() / 1000.0
		if current_time - last_launch_time >= cooldown:
			var sticker = sticker_scene.instantiate()
			var marker_2d: Marker2D = $launcher_pivot/Marker2D
			sticker.global_position = marker_2d.global_position
			sticker.direction = (get_global_mouse_position() - global_position).normalized()
			get_parent().add_child(sticker)
			last_launch_time = current_time
	
	velocity = lerp(velocity, velocity, 0.1)
	#print(velocity)
	move_and_slide()
	if not can_take_damage:
		damage_timer += delta
		if damage_timer >= damage_cooldown:
			can_take_damage = true
			anim.set_modulate(Color(1,1,1,1))
			damage_timer = 0.0

func launcher_rotation():
	var rot = launcher_pivot.rotation_degrees
	launcher_pivot.look_at(get_global_mouse_position())
	rot = fmod(rot, 360)
	if (rot >= 90 and rot <= 270) or (rot <= -90 and rot >= -270):
		sticker_launcher.play("left")
	else:
		sticker_launcher.play("right")
	#print(rot)
func take_damage():
	if can_take_damage:
		health -= 1
		print(health)
		can_take_damage = false
		anim.set_modulate(Color(0.86,0.14,0,1))
		
	

func state_machine():
	if velocity.x == SPEED:
		anim.play("right_side_walk")
		facing_state =4
	if velocity.x == -SPEED:
		anim.play("left_side_walk")
		facing_state =3
	if velocity.y == -SPEED:
		anim.play("back_walk")
		facing_state =2
	if velocity.y == SPEED:
		anim.play("front_walk")
		facing_state =1
	if facing_state ==1 and velocity == Vector2.ZERO:
		anim.play("front_idle")
	if facing_state ==2 and velocity == Vector2.ZERO:
		anim.play("back_idle")
	if facing_state ==3 and velocity == Vector2.ZERO:
		anim.play("left_side_idle")
	if facing_state ==4 and velocity == Vector2.ZERO:
		anim.play("right_side_idle")

	
	
	
	
	
	
	
	
	
