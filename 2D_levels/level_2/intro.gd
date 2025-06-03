extends Node

@onready var intro: AnimationPlayer = $Intro
var play_intro = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if play_intro:
		intro.play("intro")
		print("playing")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
