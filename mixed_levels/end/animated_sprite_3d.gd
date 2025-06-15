extends AnimatedSprite3D
@onready var floating: AnimationPlayer = $floating

func _ready() -> void:
	floating.play("floatng")

func _on_floating_animation_finished(anim_name: StringName) -> void:
	floating.play("floatng")
