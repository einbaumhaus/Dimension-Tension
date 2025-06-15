extends Node

@onready var note_count: Label = $"../mission/Control/note count"
@onready var mission_2: Label = $"../mission/Control/VBoxContainer/mission2"

@onready var mission: Label = $"../mission/Control/VBoxContainer/mission"
@onready var door_2: Area2D = $"../assets/door/door2"

var notes = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if notes == 3:
		pass #add door open logic here 

func collect():
	notes += 1
	print("note added")
	note_count.set_text(str(notes))
	if notes == 5:
		mission_2.set_text("")
		mission.set_text("door unlocked")
		door_2.open()
