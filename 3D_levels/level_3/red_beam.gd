extends Area3D
@onready var lives_manager: Node = $"../../../../../LivesManager"

@onready var caught: Node2D = $"../../../../../caught_screen/caught"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		caught.visible = true
		caught.active = true
		lives_manager.decrease_health()
