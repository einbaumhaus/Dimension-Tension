extends RigidBody2D

@onready var game_manager: Node = %GameManager

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if (y_delta > 50):
			print("destroy enemy")
			game_manager.add_point()
			queue_free()
			body.jump()
		else:
			print("player take damage")
			game_manager.decrease_health()
			print(x_delta)
			if (x_delta < 0):
				body.jump_side(-500)
			else:
				body.jump_side(500)
