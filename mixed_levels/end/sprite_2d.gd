extends Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("new_animation")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	animation_player.play("new_animation")
