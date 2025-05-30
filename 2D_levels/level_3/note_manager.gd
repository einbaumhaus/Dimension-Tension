extends Node
@onready var note_count: Label = $"../mission/Control/VBoxContainer/note count"
@onready var mission: Label = $"../mission/Control/VBoxContainer/mission"

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
	note_count.set_text(str(notes) + "/5 notes")
	if notes == 5:
		note_count.set_text("door unlocked")
		mission.set_text("")
