extends Area2D
@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
@onready var path_2d: Path2D = $Path2D
var player = null
var speed = 400.0  # adjust this for how fast the player moves along the path
var moving = false

func _ready():
	pass

func _on_body_entered(body):
	if body.name == "Player":
		player = body
		moving = true
		path_follow.progress = 0.0  # start at beginning

func _process(delta):
	if moving and player:
		path_follow.progress += delta * speed
		player.global_position = path_follow.global_position
	if path_follow.progress >= path_2d.curve.get_baked_length():
		moving = false
		# Optionally: restore player control here
