extends Timer

@onready var player: CharacterBody3D = $"../Player"


func _on_timeout() -> void:
	print("done")
	player.SPEED = 7.0
	player.acceleration = 30

func start_timer():
	start()
	print("started")
	player.velocity = Vector3(0,0,0)
	player.SPEED = 0
	player.acceleration = 0
