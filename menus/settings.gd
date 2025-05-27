extends Control
@onready var main_menu: Control = $"../main_menu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_sens_value_changed(value: float) -> void:
	GlobalSettings.mouse_sensitivity = value


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)


func _on_window_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_button_pressed() -> void:
	visible = false
	main_menu.visible = true
