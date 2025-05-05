extends CharacterBody3D
#constants
const SPEED = 4.0
const STOP_DISTANCE = 2
var _gravity := -30.0

var health = 5

@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D
@onready var main_body: MeshInstance3D = $main_body

func _ready() -> void:
	var hitbox = $Launch_col
	hitbox.connect("body_part_hit", Callable(self, "hit"))
	var mat = main_body.get_active_material(0)
	if mat:
		main_body.set_surface_override_material(0, mat.duplicate())
func _physics_process(delta: float) -> void:
	#check for player
	var player = get_tree().get_nodes_in_group("player")
	var enemy_pos = global_transform.origin
	var player_pos = player[0].global_transform.origin
	if player.size() == 0:
		return  # No player found
	var direction = (Global.player_current_pos - global_position)
	if global_transform.origin.distance_to(player_pos) > STOP_DISTANCE and is_on_floor():
		direction = direction.normalized()
		velocity = direction * SPEED
	#looking
	player_pos.y = enemy_pos.y
	$head.look_at(player_pos, Vector3.UP)
	$foot.look_at(player_pos, Vector3.UP)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	
	move_and_slide()

func hit(damage: int) -> void:
	health -= damage
	print(name, " was hit! Health:", health)
	var mat = main_body.get_active_material(0)
	mat.albedo_color += Color(0.3, 0, 0, 0)
	print("Material ID:", main_body.get_active_material(0).get_instance_id())
	gpu_particles_3d.emitting = true
	gpu_particles_3d.restart()
	gpu_particles_3d.material_override = mat
	if health <= 0:
		queue_free()
