extends Node3D

var initial_states = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for enemy in get_children():
		var state = {
			"scene": enemy.duplicate(), # full duplicate
			"transform": enemy.global_transform
		}
		initial_states.append(state)

func reset_enemies():
	# Delete all current enemies
	for enemy in get_children():
		enemy.queue_free()

	await get_tree().process_frame  # Wait one frame to fully clear

	# Re-instantiate all enemies from initial_states
	for state in initial_states:
		var new_enemy = state["scene"].duplicate()
		add_child(new_enemy)
		new_enemy.global_transform = state["transform"]
