extends Node
var wafers = 0
@onready var wafer_count: Label = $"../wafer/wafer_count"
@onready var transition: Area3D = $"../assets/wooden_door2/transition"
@onready var mission: Label = $"../wafer/mission"
func add_wafer():
	wafers += 1
	print(wafers)

func _process(delta: float) -> void:
	if wafers == 3:
		transition.monitoring = true
		mission.text = "DOOR UNLOCKED"

	wafer_count.text = str(wafers)
