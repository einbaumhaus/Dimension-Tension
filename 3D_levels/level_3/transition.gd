extends Area3D

@onready var player: CharacterBody3D = $"../../../Player"
@onready var animation_player: AnimationPlayer = $"../outro/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		animation_player.play("outro")
		player.queue_free()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://mixed_levels/endboss/endboss_1.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
