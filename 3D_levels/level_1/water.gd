extends MeshInstance3D

@onready var checkpoint_1: Area3D = $"../../../../checkpoints/checkpoint1"
@onready var checkpoint_2: Area3D = $"../../../../checkpoints/checkpoint2"
@onready var checkpoint_3: Area3D = $"../../../../checkpoints/checkpoint3"

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
	else:
		print("not player")


func _on_secret_boundary_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Global.next_scene = "res://3D_levels/level1_ocean/easter_egg1.tscn"
		get_tree().change_scene_to_packed(Global.loading_screen)
func respawn_player():
	if checkpoint_1.checkpoint1_on:
		checkpoint_1.respawn()
		print("respawn1")
	elif checkpoint_2.checkpoint2_on:
		checkpoint_2.respawn()
		print("respawn2")
	elif checkpoint_3.checkpoint3_on:
		checkpoint_3.respawn()
		print("respawn3")
	else:
		get_tree().reload_current_scene.call_deferred()


func _on_respawn_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		respawn_player()
