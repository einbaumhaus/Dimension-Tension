extends Area2D
@onready var animation_player: AnimationPlayer = $"../outro/AnimationPlayer"
@onready var player_topdown: CharacterBody2D = $"../../../player_topdown"

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var door_open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func open():
	animated_sprite_2d.play("open")
	door_open = true


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player_topdown" and door_open:
		animation_player.play("outro")
		player_topdown.process_mode = Node.PROCESS_MODE_DISABLED


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://3D_levels/level_3/level_3_3d.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
