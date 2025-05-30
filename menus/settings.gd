extends Control
@onready var main_menu: Control = get_node_or_null("../main_menu")
@onready var stuff: Control = get_node_or_null("../stuff")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MarginContainer/VBoxContainer/mouse_sens.value = GlobalSettings.mouse_sensitivity
	$MarginContainer/VBoxContainer/volume.value = GlobalSettings.volume
	$MarginContainer/VBoxContainer/mute.button_pressed = GlobalSettings.muted
	$MarginContainer/VBoxContainer/window.select(GlobalSettings.window_mode)
	$MarginContainer/VBoxContainer/cursors.select(GlobalSettings.cursor_index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_sens_value_changed(value: float) -> void:
	GlobalSettings.mouse_sensitivity = value


func _on_volume_value_changed(value: float) -> void:
	GlobalSettings.volume = value
	AudioServer.set_bus_volume_db(0, value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	GlobalSettings.muted = toggled_on
	AudioServer.set_bus_mute(0,toggled_on)


func _on_window_item_selected(index: int) -> void:
	GlobalSettings.window_mode = index
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_button_pressed() -> void:
	visible = false
	if main_menu:
		main_menu.visible = true
	if stuff:
		stuff.visible = true

func _on_option_button_item_selected(index: int) -> void:
	GlobalSettings.cursor_index = index
	match index:
		0:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor.png"))
	match index:
		1:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor_evelius.png"))
	match index:
		2:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor_tobler.png"))
	match index:
		3:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor_gipfeli.png"))
	match index:
		4:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor_TDi4.png"))
	match index:
		5:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor_lukas.png"))
	match index:
		6:
			DisplayServer.cursor_set_custom_image(preload("res://assets/cursor/cursor_jayk.png"))


func _on_vsync_toggled(toggled_on: bool) -> void:
	GlobalSettings.vsync = toggled_on
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		


func _on_performance_m_toggled(toggled_on: bool) -> void:
	GlobalSettings.performance_mode = toggled_on
	if toggled_on:
		Engine.max_fps = 60
	else:
		Engine.max_fps = 0
