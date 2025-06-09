extends Area3D

@onready var outro: AnimationPlayer = $"../../../outro/outro"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		outro.play("outro")


func _on_outro_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file.call_deferred("res://2D_levels/level_2/lvl_2.tscn")
