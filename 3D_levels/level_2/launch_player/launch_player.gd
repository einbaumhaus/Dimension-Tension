extends CharacterBody3D

#constants
var SPEED = 7.0
const JUMP_VELOCITY = 14
#variables
var health := 100
@onready var healthbar: ProgressBar = get_node_or_null("../mission/healthbar")

var sprinting = false
var target_fov := 75.0
const WALK_FOV := 75.0
const SPRINT_FOV := 90.0
const FOV_TRANSITION_SPEED := 5.0

var acceleration = 30
var _gravity := -30.0
var _camera_input_direction := Vector2.ZERO
var _last_movement_direction := Vector3.BACK
var mouse_sensitivity = null
@onready var _camera: Camera3D = $Camera3D
@onready var elim: CanvasLayer = $"../elim_scene"
@onready var mission: CanvasLayer = $"../mission"
@onready var legs: AnimatedSprite3D = $legs

@onready var footstep: AudioStreamPlayer3D = $Player_Audio/footstep
@onready var footstep_audio: AnimationPlayer = $Player_Audio/footstep2
#launch stuff
@onready var launch_anim = $Camera3D/sticker_launcher/animations/AnimationPlayer
@onready var sticker_output = $Camera3D/sticker_launcher/RayCast3D

@onready var launch_anim2 = $Camera3D/sticker_launcher2/animations/AnimationPlayer
@onready var sticker_output2 = $Camera3D/sticker_launcher2/RayCast3D

var sticker = load("res://3D_levels/level_2/assets/sticker_launcher/sticker/sticker.tscn")
var instance
@export var mag_size = 20
var mag_size2 = 20
var death_handled = false
#launcher delay
var last_launch_time = 0.0
var last_launch_time2 = 0.0
@export var cooldown = 0.2 
var cooldown2 = 0.1 # seconds between sticker launches

#2 launchers
var second_launcher = false

@onready var wave_manager: Node = get_node_or_null("../wave_manager")

func _ready() -> void:
	if healthbar != null:
		healthbar.value = health

func _input(event: InputEvent) -> void: #add mouse input
	if event.is_action_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func play_footstep():
	footstep.pitch_scale = randf_range(0.8, 1.2)
	footstep.play()
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var delta_motion = event.relative * clamp(GlobalSettings.mouse_sensitivity, 0.001, 0.5)
		_camera.rotation_degrees.x -= delta_motion.y
		_camera.rotation_degrees.y -= delta_motion.x
		_camera.rotation_degrees.x = clamp(_camera.rotation_degrees.x, -60, 60)

func take_damage(amount: int) -> void:
	health -= amount
	print("Player hit! Health:", health)
	if health <= 0 and not death_handled:
		death_handled = false  # So the process can run again
		elim.visible = true
		elim.process_mode = Node.PROCESS_MODE_ALWAYS
		mission.visible = false

func _physics_process(delta: float) -> void:
	if healthbar != null:
		healthbar.value = health
	
	#launch&reload
	if Input.is_action_pressed("left_click"):
		var current_time = Time.get_ticks_msec() / 1000.0
		if current_time - last_launch_time >= cooldown:
			if (mag_size == 0):
				launch_anim.play("reload")
				mag_size = 20
			elif !launch_anim.is_playing():
				launch_anim.play("launch")
				instance = sticker.instantiate()
				instance.position = sticker_output.global_position
				instance.transform.basis = sticker_output.global_transform.basis
				get_parent().add_child(instance)
				mag_size -= 1
				print(mag_size)
				last_launch_time = current_time
	if second_launcher:
		if Input.is_action_pressed("left_click"):
			var current_time2 = Time.get_ticks_msec() / 1000.0
			if current_time2 - last_launch_time2 >= cooldown2:
				if (mag_size2 == 0):
					launch_anim2.play("reload")
					mag_size2 = 20
				elif !launch_anim2.is_playing():
					launch_anim2.play("launch")
					instance = sticker.instantiate()
					instance.position = sticker_output2.global_position
					instance.transform.basis = sticker_output2.global_transform.basis
					get_parent().add_child(instance)
					mag_size2 -= 1
					print(mag_size)
					last_launch_time2 = current_time2

	if Input.is_action_pressed("R"):
		launch_anim.play("reload")
		mag_size = 20

	#Navigation
	Global.player_current_pos = global_position
	
	
	legs.rotation_degrees.y = _camera.rotation_degrees.y
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("shift"):
		SPEED = 10
		target_fov = SPRINT_FOV
		sprinting = true
	else:
		SPEED = 7
		target_fov = WALK_FOV
		sprinting = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var raw_input := Input.get_vector("left", "right", "up", "down")
	var forward := _camera.global_basis.z
	var right := _camera.global_basis.x
	
	var move_direction := forward * raw_input.y + right * raw_input.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	if move_direction.length() > 0.2:
		_last_movement_direction = move_direction
	var target_angle := Vector3.BACK.signed_angle_to(_last_movement_direction, Vector3.UP)
	var input_dir := Input.get_vector("left", "right", "up", "down")
	
	var y_velocity := velocity.y
	velocity.y = 0.0
	velocity = velocity.move_toward(move_direction * SPEED, acceleration * delta)
	velocity.y = y_velocity + _gravity * delta
	
	if move_direction != Vector3() and is_on_floor():
		if sprinting:
			footstep_audio.play("wlaking", -1, 1.5)
		else:
			footstep_audio.play("wlaking")
	move_and_slide()
	_camera.fov = lerp(_camera.fov, target_fov, delta * FOV_TRANSITION_SPEED)
	#death

	var es = elim.get_node("elim_scene")

	if es.done and not death_handled:
		print("RESPAWN STARTING")
		death_handled = true

		if wave_manager != null:
			if wave_manager.wave2:
				es.done = false  # Reset done
				es.get_node("AnimationPlayer").play("respawn")  # Manually replay
				wave_manager.start_w2()
				elim.visible = false
				print("WAVE 2 RESET")
			elif wave_manager.wave1:
				print("RELOADING SCENE (wave1)")
				get_tree().reload_current_scene()
		else:
			print("RELOADING SCENE (no wave manager)")
			get_tree().reload_current_scene()
