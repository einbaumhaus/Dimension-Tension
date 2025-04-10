extends Node2D

@onready var train_player: AnimationPlayer = $elements/train_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	train_player.play("rbs_drive")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
