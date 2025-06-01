extends Node3D
@onready var player_flashlight = $Player/Camera3D/flashlight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_flashlight.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
