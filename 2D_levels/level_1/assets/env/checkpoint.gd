extends Area2D

var checkpoint1_on = false
@onready var player: CharacterBody2D = $"../../Player"
@onready var checkpoint: Area2D = $"."
@onready var respawn_point: Marker2D = $RespawnPoint
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		checkpoint1_on = true


func _on_fall_limit_2_body_entered(body: Node2D) -> void:
	if checkpoint1_on and body.name == "Player":
		player.global_position = respawn_point.global_position
