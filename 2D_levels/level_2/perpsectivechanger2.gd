extends Area2D

@onready var outro_anim: AnimationPlayer = $"../outro/outro_anim"
@onready var player_topdown: CharacterBody2D = $"../player_topdown"
@onready var outro: Node = $"../outro"
@onready var camera_2d: Camera2D = $"../Camera2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player_topdown":
		camera_2d.enabled = true
		player_topdown.get_node("Camera2D").enabled = false
		outro_anim.play("outro")
		player_topdown.process_mode =Node.PROCESS_MODE_DISABLED
		player_topdown.visible = false


func _on_outro_anim_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://3D_levels/level_2/lvl_stages/level_2_3d_1.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
