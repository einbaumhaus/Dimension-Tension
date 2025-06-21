extends Area3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var not_picked_up = true
@onready var wafer_manager: Node = $"../../WaferManager"
@onready var wafer: Area3D = $"."

func _ready() -> void:
	animation_player.play("spin")
	
func _process(delta: float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if not_picked_up:
		animation_player.play("spin")
		

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		not_picked_up = false
		animation_player.play("pick up")
		wafer_manager.add_wafer()
		wafer.remove_from_group("wafers")
