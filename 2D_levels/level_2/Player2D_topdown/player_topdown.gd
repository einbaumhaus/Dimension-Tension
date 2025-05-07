extends CharacterBody2D

var sticker_scene = preload("res://2D_levels/level_2/Player2D_topdown/sticker_launcher/sticker/sticker.tscn")
var new_vel = Vector2.ZERO
const SPEED = 300
const JUMP_VELOCITY = -400.0
var facing_state = 1
#records what direction play is facing, 1=front, 2=back, 3=left, 4= right
@onready var launcher_pivot: Node2D = $launcher_pivot
@onready var sticker_launcher: AnimatedSprite2D = $launcher_pivot/sticker_launcher
@onready var anim: AnimatedSprite2D = $player

func _physics_process(delta: float) -> void:
	launcher_rotation()
	state_machine()
	#movement logic
	velocity.x = Input.get_axis("left", "right")*SPEED
	velocity.y = Input.get_axis("up", "down")*SPEED
	
	#launcher logic
	if Input.is_action_just_pressed("left_click") or Input.is_action_just_pressed("ui_accept"):
		var sticker = sticker_scene.instantiate()
		var marker_2d: Marker2D = $launcher_pivot/Marker2D
		sticker.global_position = marker_2d.global_position
		sticker.direction = (get_global_mouse_position() - global_position).normalized()
		
		get_parent().add_child(sticker)
	
	velocity = lerp(velocity, velocity, 0.1)
	#print(velocity)
	
	
	
	move_and_slide()
	

func launcher_rotation():
	var rot = launcher_pivot.rotation_degrees
	launcher_pivot.look_at(get_global_mouse_position())
	rot = fmod(rot, 360)
	if (rot >= 90 and rot <= 270) or (rot <= -90 and rot >= -270):
		sticker_launcher.play("left")
	else:
		sticker_launcher.play("right")
	#print(rot)

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

	
	
	
	
	
	
	
	
	
