extends Area3D

var checkpoint2_on = false
@onready var marker_3d: Marker3D = $Marker3D
@onready var player: CharacterBody3D = $"../../Player"
@onready var checkpoint_1: Area3D = $"../checkpoint1"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and not checkpoint2_on:
		checkpoint2_on = true
		checkpoint_1.checkpoint1_on = false
		print("checkpoint2")

func respawn():
	player.global_position = marker_3d.global_position
