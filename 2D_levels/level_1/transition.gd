extends Node

@onready var scene: Node2D = $scene
@onready var transi_anim: AnimationPlayer = $transi_anim
@onready var floating: AnimationPlayer = $"scene/evelius pivot/evelius_floating/floating"
@onready var player: CharacterBody2D = $"../Player"
var floatl = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if floatl:
		floating.play("floating")


func _on_perspective_changer_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("entered")
		scene.visible
		floatl = true
		transi_anim.play("transition")
		floating.play("floating")
		player.visible = false
		player.process_mode = Node.PROCESS_MODE_DISABLED


func _on_transi_anim_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://3D_levels/level_1/level_1_3d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
