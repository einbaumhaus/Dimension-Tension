extends Area3D

var checkpoint3_on = false
@onready var marker_3d: Marker3D = $Marker3D
@onready var player: CharacterBody3D = $"../../Player"
@onready var respawn_timer: Timer = $"../../respawnTimer"
@onready var checkpoint_1: Area3D = $"../checkpoint1"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and not checkpoint3_on:
		checkpoint3_on = true
		checkpoint_1.checkpoint1_on = false
		print("checkpoint3")

func respawn():
	player.global_position = marker_3d.global_position
	player.get_node("Camera3D").rotation_degrees = Vector3(0,0,0)
	respawn_timer.start_timer()
