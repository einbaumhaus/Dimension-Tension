extends Node
@onready var spawner_count: Label = $"../CanvasLayer2/mission/VBoxContainer/spawner_count"

@onready var mission: Label = $"../CanvasLayer2/mission/VBoxContainer/mission"
@onready var mission_2: Label = $"../CanvasLayer2/mission/VBoxContainer/mission2"

@onready var exit: Area2D = $"../exit"

var spawners = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func destroy():
	spawners += 1
	print("spawner destroyed")
	spawner_count.set_text(str(spawners) + "/4 spawners")
	if spawners == 4:
		spawner_count.set_text("exit unlocked")
		mission.set_text("")
		mission_2.set_text("")
		exit.monitoring = true
