extends Area3D

@export var damage := 1

signal body_part_hit(dam)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit():
	emit_signal("body_part_hit", damage)
