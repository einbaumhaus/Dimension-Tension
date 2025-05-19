extends Control

func _ready() -> void:
	hide()
	$AnimationPlayer.play("RESET")


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$AnimationPlayer.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		show()
		pause()
	elif  Input.is_action_just_pressed("escape") and get_tree().paused == true:
		hide()
		resume()


func _on_resume_pressed() -> void:
	var current_scene = get_tree().current_scene
	if current_scene.name == "lvl_2" or current_scene.name == "lvl_2_2" or current_scene.name == "lvl_2_3" or current_scene.name == "level_1_2d" or current_scene.name == "lvl3_2d":
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()
	resume()

func _on_restart_pressed() -> void:
	hide()
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	hide()
	resume()
	get_tree().change_scene_to_file("res://menus/level_select.tscn")

func _process(delta: float) -> void:
	testEsc()


func _on_settings_pressed() -> void:
	hide()
	resume()
	get_tree().change_scene_to_file("res://menus/settings.tscn")
