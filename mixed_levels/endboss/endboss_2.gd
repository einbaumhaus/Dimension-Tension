extends Node
@onready var outro_2: AnimationPlayer = $outro2
@onready var outro_3: AnimationPlayer = $outro3
@onready var outro_4: AnimationPlayer = $outro4
@onready var outro: AnimationPlayer = $outro1
func _ready() -> void:
	outro.play("new_animation")
	MusicPlayer.stop()


func _on_outro_1_animation_finished(anim_name: StringName) -> void:
	outro_2.play("new_animation")


func _on_outro_2_animation_finished(anim_name: StringName) -> void:
	outro_3.play("new_animation")


func _on_outro_3_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
