extends Node2D

@onready var floating: AnimationPlayer = $evelius_pivot/floating

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	floating.play("new_animation")


func _on_floating_animation_finished(anim_name: StringName) -> void:
	floating.play("new_animation")
