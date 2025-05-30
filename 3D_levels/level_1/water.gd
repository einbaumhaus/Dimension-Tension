extends MeshInstance3D

@onready var checkpoint_1: Area3D = $"../../../../checkpoints/checkpoint1"
@onready var checkpoint_2: Area3D = $"../../../../checkpoints/checkpoint2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mat = get_active_material(0)
	mat.uv1_offset += Vector3(0,0.2,0)*delta


func _on_boundary_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		respawn_player()


func _on_secret_boundary_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file.call_deferred("res://3D_levels/level1_ocean/easter_egg1.tscn")

func respawn_player():
	if checkpoint_1.checkpoint1_on:
		checkpoint_1.respawn()
	elif checkpoint_2.checkpoint2_on:
		checkpoint_2.respawn()
	else:
		get_tree().reload_current_scene.call_deferred()


func _on_respawn_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		respawn_player()
