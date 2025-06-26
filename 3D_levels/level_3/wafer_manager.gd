extends Node
var wafers = 0
@onready var wafer_count: Label = $"../wafer/wafer_count"
@onready var transition: Area3D = $"../assets/wooden_door2/transition"
@onready var wooden_door_2: Node3D = $"../assets/wooden_door2"

@onready var mission_2: Label = $"../wafer/mission2"
@onready var compass_needle: TextureRect = $"../wafer/compass_needle"
@onready var mission: Label = $"../wafer/mission"
func add_wafer():
	wafers += 1
	print(wafers)

func _process(delta: float) -> void:
	if wafers == 3:
		transition.monitoring = true
		mission.text = "DOOR UNLOCKED"
		wooden_door_2.add_to_group("wafers")
		compass_needle.become_purple()
		mission_2.text = "DOOR COMPASS"
	wafer_count.text = str(wafers)
