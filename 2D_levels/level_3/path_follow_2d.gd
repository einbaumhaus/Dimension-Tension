extends PathFollow2D

@onready var larrybo: CharacterBody2D = $larrybo
@onready var sprite_2d: AnimatedSprite2D = $larrybo/Sprite2D

var last_position = Vector2.ZERO
var speed = 75

func _physics_process(delta: float) -> void:
	if larrybo.patrolling:
		progress += speed * delta
		var movement = global_position - last_position
		last_position = global_position
		if movement.x > 1:
			sprite_2d.play("right_side")
		if movement.x < -1:
			sprite_2d.play("left_side")
		if movement.y > 1:
			sprite_2d.play("front")
		if movement.y < -1:
			sprite_2d.play("back")
