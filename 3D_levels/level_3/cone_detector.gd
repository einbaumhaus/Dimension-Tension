extends Area3D

@onready var mitzi: CharacterBody3D = $"../../../../enemies/mitzi1/PathFollow3D/mitzi"
@onready var beam: Sprite3D = $"../../../../enemies/mitzi1/PathFollow3D/mitzi/red_beam/beam"
@onready var red_beam: Area3D = $"../../../../enemies/mitzi1/PathFollow3D/mitzi/red_beam"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "mitzi":
		body.get_node("red_beam").visible = false
		body.get_node("red_beam").monitoring = false

func _on_body_exited(body: Node3D) -> void:
	if body.name == "mitzi":
		body.get_node("red_beam").visible = true
		body.get_node("red_beam").monitoring = true
