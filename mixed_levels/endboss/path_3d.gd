extends Path3D

@onready var path_follow_3d: PathFollow3D = $PathFollow3D
@export var speed = 8
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow_3d.progress += speed*delta
