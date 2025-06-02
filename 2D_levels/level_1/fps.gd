extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalSettings.fps_enabled:
		visible = true
	else:
		visible = false
