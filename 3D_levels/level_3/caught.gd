extends Node2D
@onready var player: CharacterBody3D = $"../../Player"

@onready var progress_bar: ProgressBar = $Control2/ProgressBar
var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		player.SPEED = 0
		player.JUMP_VELOCITY = 0
		player.sprint_enabled = false
		if Input.is_action_just_pressed("ui_accept"):
			progress_bar.value += 1
		if progress_bar.value == 10:
			visible = false
			player.SPEED = 7.0
			player.JUMP_VELOCITY = 14
			player.sprint_enabled = true
			active = false
			progress_bar.value = 0
