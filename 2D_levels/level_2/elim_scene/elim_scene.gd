extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var done = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("respawn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	done = true
