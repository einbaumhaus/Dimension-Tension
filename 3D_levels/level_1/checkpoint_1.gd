extends Area3D

var checkpoint1_on = false
@onready var marker_3d: Marker3D = $Marker3D
@onready var respawn_timer: Timer = $"../../respawnTimer"

@onready var player: CharacterBody3D = $"../../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and not checkpoint1_on:
		checkpoint1_on = true
		print("checkpoint1")

func respawn():
	player.global_position = marker_3d.global_position
	player.get_node("Camera3D").rotation_degrees = Vector3(0,0,0)
	respawn_timer.start_timer()
