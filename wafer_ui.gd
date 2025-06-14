extends Node3D
@onready var wafer_pivot: Node3D = $wafer_pivot

func _physics_process(delta: float) -> void:
	wafer_pivot.rotation_degrees.y += 30*delta
