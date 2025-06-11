extends Area2D

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
		Global.next_scene = "res://3D_levels/level_3/level_3_3d.tscn"
		get_tree().change_scene_to_packed(Global.loading_screen)
