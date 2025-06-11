extends Node
@onready var flip_change_timer: Timer = $flip_change_timer
@onready var player: CharacterBody3D = $"../Player"

@onready var rotate: AnimationPlayer = $"../assets/ROOM_PIVOT/rotate"
var anim_done = false
@onready var path_3d: Path3D = $"../Path3D"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var camera_3d: Camera3D = $Camera3D
@onready var outro: Node3D = $outro
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func flip():
	if not anim_done:
		rotate.play("rotate")
		flip_change_timer.start()
		path_3d.process_mode = Node.PROCESS_MODE_DISABLED
		path_3d.visible = false
	else:
		pass


func _on_rotate_animation_finished(anim_name: StringName) -> void:
	anim_done = true


func _on_flip_change_timer_timeout() -> void:
	outro.visible = true
	camera_3d.current = true
	player.visible = false
	player.process_mode = Node.PROCESS_MODE_DISABLED
	animation_player.play("outro")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Global.next_scene = "res://mixed_levels/endboss/endboss_2.tscn"
	get_tree().change_scene_to_packed(Global.loading_screen)
