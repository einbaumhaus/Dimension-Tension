extends Node
@onready var elim_scene_2: CanvasLayer = $"../elim_scene2"

@export var hearts: Array[Node]

var points = 0
var lives = 5

func decrease_health():
	lives -= 1
	print(lives)
	for h in 5:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()

func _process(delta: float) -> void:
	if lives == 0:
		elim_scene_2.visible = true
		elim_scene_2.process_mode = Node.PROCESS_MODE_ALWAYS
		if elim_scene_2.get_node("elim_scene").done:
			get_tree().reload_current_scene()
