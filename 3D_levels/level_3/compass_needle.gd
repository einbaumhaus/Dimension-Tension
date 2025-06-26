extends TextureRect

@onready var player: CharacterBody3D = $"../../Player"
@onready var camera: Camera3D = player.get_node("Camera3D")
@onready var needle: TextureRect = $"."
@onready var mission_2: Label = $"../mission2"
var purple: Texture2D = load("res://mixed_levels/end/arrow_door.png")

var time_accum = 0.0
func _process(delta):
	time_accum += delta
	if time_accum >= 0.1:
		time_accum = 0.0
		var target = get_nearest_collectable()
		if target:
			needle.visible = true
			mission_2.visible = true
			update_needle_rotation(target)
		else:
			needle.visible = false
			mission_2.visible = false

func get_nearest_collectable() -> Node3D:
	if not is_instance_valid(player):
		return null

	var nearest: Node3D = null
	var min_dist := INF

	for c in get_tree().get_nodes_in_group("wafers"):
		if not is_instance_valid(c):
			continue
		if not c.is_inside_tree():
			continue
		if not c is Node3D:
			continue

		var dist = player.global_position.distance_to(c.global_position)
		if dist < min_dist:
			min_dist = dist
			nearest = c

	return nearest
func update_needle_rotation(target: Node3D):
	var from = player.global_position
	var to = target.global_position
	var world_dir = (to - from).normalized()

	# Convert direction to camera space
	var camera_basis = camera.global_transform.basis
	var cam_right = camera_basis.x
	var cam_forward = -camera_basis.z

	# Flatten to horizontal plane
	cam_right.y = 0
	cam_forward.y = 0
	world_dir.y = 0

	var x = world_dir.dot(cam_right.normalized())
	var y = world_dir.dot(cam_forward.normalized())

	var angle = atan2(x, y)
	needle.rotation = angle + deg_to_rad(-180)

func become_purple():
	set_texture(purple)
