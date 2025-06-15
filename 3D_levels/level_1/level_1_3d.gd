extends Node3D

@onready var intro: AnimationPlayer = $intro/intro

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	intro.play("intro")
	MusicPlayer.tonband2()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
