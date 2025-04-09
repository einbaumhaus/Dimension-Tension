extends CSGBox3D

var value = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value += Vector3(1,0,0)*delta
	material.set_uv1_offset(value)
