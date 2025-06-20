extends Node
@onready var outro_2: AnimationPlayer = $outro2
@onready var outro_3: AnimationPlayer = $outro3
@onready var outro_4: AnimationPlayer = $outro4
@onready var outro_5: AnimationPlayer = $outro5
@onready var outro: AnimationPlayer = $outro1
func _ready() -> void:
	outro.play("new_animation")
	MusicPlayer.tonband6()


func _on_outro_1_animation_finished(anim_name: StringName) -> void:
	outro_2.play("new_animation")


func _on_outro_2_animation_finished(anim_name: StringName) -> void:
	outro_3.play("new_animation")


func _on_outro_3_animation_finished(anim_name: StringName) -> void:
	outro_4.play("new_animation")


func _on_outro_4_animation_finished(anim_name: StringName) -> void:
	outro_5.play("new_animation")


func _on_outro_5_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://mixed_levels/end/end_credit_level.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
