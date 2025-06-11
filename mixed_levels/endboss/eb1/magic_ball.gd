extends Area3D

@export var speed: float = 30
@export var lifetime: float = 5.0
@export var damage: int = 10

var velocity: Vector3 = Vector3.ZERO

func _ready() -> void:
	# Despawn after timeout
	$Timer.wait_time = lifetime
	$Timer.start()

	connect("body_entered", Callable(self, "_on_body_entered"))

func set_velocity(direction: Vector3) -> void:
	velocity = direction.normalized() * speed

func _physics_process(delta: float) -> void:
	global_translate(velocity * delta)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		if body.has_method("take_damage"):
			body.take_damage(damage)
		queue_free()
		print("magc_gone")

func _on_Timer_timeout() -> void:
	print("magic_gone")
	queue_free()
