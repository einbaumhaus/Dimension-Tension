extends Control
@onready var settings: Control = $settings
@onready var stuff: Control = $stuff
@onready var escape_popup: Node2D = get_node_or_null("../escape_popup")
@onready var animation_player: AnimationPlayer = $stuff/AnimationPlayer

func _ready() -> void:
	hide()
	animation_player.play("RESET")


func resume():
	get_tree().paused = false
	animation_player.play_backwards("blur")
	
func pause():
	get_tree().paused = true
	if escape_popup:
		escape_popup.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	animation_player.play("blur")
	
func testEsc():
	if (Input.is_action_just_pressed("escape") or Input.is_action_just_pressed("p")) and get_tree().paused == false:
		show()
		pause()
	elif  Input.is_action_just_pressed("escape") and get_tree().paused == true and (escape_popup == null or escape_popup.visible == false):
		var current_scene = get_tree().current_scene
		hide()
		resume()
		if current_scene.name == "lvl_2" or current_scene.name == "lvl_2_2" or current_scene.name == "lvl_2_3" or current_scene.name == "level_1" or current_scene.name == "lvl3_2d" or current_scene.name == "eg1":
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_resume_pressed() -> void:
	var current_scene = get_tree().current_scene
	if current_scene.name == "lvl_2" or current_scene.name == "lvl_2_2" or current_scene.name == "lvl_2_3" or current_scene.name == "level_1" or current_scene.name == "lvl3_2d":
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
	get_tree().change_scene_to_file("res://menus/menu_manager.tscn")

func _process(delta: float) -> void:
	testEsc()


func _on_settings_pressed() -> void:
	stuff.visible = false
	settings.visible = true
