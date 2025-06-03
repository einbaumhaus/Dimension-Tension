extends CharacterBody2D

@onready var canvas_layer: CanvasLayer = get_node_or_null("../CanvasLayer")
@onready var game_manager: Node = get_node_or_null("%LifeManager")

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
var health = 5
#records what direction play is facing, 1=front, 2=back, 3=left, 4= right
@onready var launcher_pivot: Node2D = $launcher_pivot
@onready var sticker_launcher: AnimatedSprite2D = $launcher_pivot/sticker_launcher
@onready var anim: AnimatedSprite2D = $player
@onready var reload: Label = $reload
@onready var reload_timer: Timer = $reload_timer


#launcher delay
var last_launch_time = 0.0
var cooldown = 0.2  # seconds between sticker launches
var ammo = 20
var reload_done = true

#disable launcher
var launcher_active = true

#maze logic
const PUSH_FORCE = 5.0
const MIN_PUSH_FORCE = 10.0

func _physics_process(delta: float) -> void:
	launcher_rotation()
	state_machine()
	#movement logic
	velocity.x = Input.get_axis("left", "right")
	velocity.y = Input.get_axis("up", "down")
	velocity = velocity.normalized()*SPEED

	#launcher logic
	if ammo >= 1:
		if reload_done:
			if Input.is_action_pressed("left_click") and launcher_active == true or Input.is_action_pressed("ui_accept") and launcher_active == true:
				var current_time = Time.get_ticks_msec() / 1000.0
				if current_time - last_launch_time >= cooldown:
					var sticker = sticker_scene.instantiate()
					var marker_2d: Marker2D = $launcher_pivot/Marker2D
					sticker.global_position = marker_2d.global_position
					sticker.direction = (get_global_mouse_position() - global_position).normalized()
					get_parent().add_child(sticker)
					ammo -=1
					last_launch_time = current_time
	else:
		reload.visible = true
		reload_timer.start()
		reload_done = false
		ammo = 20
	
	velocity = lerp(velocity, velocity, 0.1)
	#print(velocity)
	move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			var push_force = (PUSH_FORCE * velocity.length() / SPEED) + MIN_PUSH_FORCE
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
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
		game_manager.decrease_health()
		if health <= 0:
			canvas_layer.visible = true
			canvas_layer.process_mode = Node.PROCESS_MODE_ALWAYS
			if canvas_layer.get_node("elim_scene").done:
				get_tree().reload_current_scene()
	

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

func _on_reload_timer_timeout() -> void:
	print("reload done")
	ammo = 20
	reload.visible = false
	reload_done = true
