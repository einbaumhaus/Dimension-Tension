extends Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func shake_camera(duration: float, strength: float) -> void:
	var original_position: Vector3 = global_position
	var shake_start_time: float = Time.get_ticks_msec() / 1000.0 # convert to seconds
	
	while (Time.get_ticks_msec() / 1000.0) - shake_start_time < duration:
		var x: float = randf_range(-strength, strength)
		var y: float = randf_range(-strength, strength)
		global_position = original_position + Vector3(x, y, 0)
		await get_tree().process_frame
	global_position = original_position
