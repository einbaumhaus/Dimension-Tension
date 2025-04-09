extends CharacterBody3D

#constants
const SPEED = 7.0
const JUMP_VELOCITY = 14
#variables
var acceleration = 30
var _gravity := -30.0
var _camera_input_direction := Vector2.ZERO
var _last_movement_direction := Vector3.BACK
var mouse_sensitivity := 0.25
@onready var _camera: Camera3D = $Camera3D

func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void: #add mouse input
	if event.is_action_pressed("left_click"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _unhandled_input(event: InputEvent) -> void:
	var is_camera_motion := (
		event is InputEventMouseMotion and
		Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	)
	if is_camera_motion:
		_camera_input_direction = event.screen_relative * mouse_sensitivity

func _physics_process(delta: float) -> void:
	_camera.rotation.x -= _camera_input_direction.y * delta
	_camera.rotation.y -= _camera_input_direction.x * delta
	_camera.rotation.x = clamp(_camera.rotation.x, -PI / 3.0, PI / 6.0)
	_camera_input_direction = Vector2.ZERO
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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
	move_and_slide()
