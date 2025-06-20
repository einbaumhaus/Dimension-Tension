extends Area3D

var checkpoint2_on = false
@onready var marker_3d: Marker3D = $Marker3D
@onready var respawn_timer: Timer = $"../../respawnTimer"
@onready var player: CharacterBody3D = $"../../Player"
@onready var checkpoint_3: Area3D = $"../checkpoint3"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and not checkpoint2_on:
		checkpoint2_on = true
		checkpoint_3.checkpoint3_on = false
		print("checkpoint2")

func respawn():
	player.global_position = marker_3d.global_position
	player.get_node("Camera3D").rotation_degrees = Vector3(0,0,0)
	respawn_timer.start_timer()
