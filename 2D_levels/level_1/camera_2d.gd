extends Camera2D
@onready var player: CharacterBody2D = $"../Player"

func _process(delta):
	global_position = lerp(global_position, player.global_position, 0.1)
