extends Node

func _ready() -> void:
	if OS.has_feature("web"):  # detect HTML5/Web
		GlobalSettings.performance_mode = true
		Engine.max_fps = 60
		print("performance_mode on")
	else:
		pass
