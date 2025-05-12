extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]

const SPEED = 50

func _physics_process(delta: float) -> void:
	if global_position.distance_to(player.global_position) < 1000:
		velocity = (player.global_position - global_position).normalized() * SPEED
	move_and_slide()
