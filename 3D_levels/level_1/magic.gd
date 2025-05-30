extends Area3D

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
var inside = false
@onready var player: CharacterBody3D = $"../../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inside:
		animation_player.play("magic change")
		player.anim.play("wand")
		if animation_player.animation_finished:
			queue_free()


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		inside = true
