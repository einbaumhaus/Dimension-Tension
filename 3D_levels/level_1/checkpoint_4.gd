extends Area3D

var checkpoint4_on = false
@onready var marker_3d: Marker3D = $Marker3D
@onready var player: CharacterBody3D = $"../../Player"
@onready var respawn_timer: Timer = $"../../respawnTimer"
@onready var checkpoint_2: Area3D = $"../checkpoint2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player" and not checkpoint4_on:
		checkpoint4_on = true
		checkpoint_2.checkpoint2_on = false
		print("checkpoint4")

func respawn():
	player.global_position = marker_3d.global_position
	player.get_node("Camera3D").rotation_degrees = Vector3(0,90,0)
	respawn_timer.start_timer()
