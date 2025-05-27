extends Area3D
@onready var path_3d: Path3D = $Path3D
@onready var path_follow: PathFollow3D = $Path3D/PathFollow3D

var player = null
var speed = 40.0  # adjust this for how fast the player moves along the path
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving and player:
		path_follow.progress += delta * speed
		player.global_position = path_follow.global_position
	if path_follow.progress >= path_3d.curve.get_baked_length():
		moving = false


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		player = body
		moving = true
		path_follow.progress = 0.0  # start at beginning
