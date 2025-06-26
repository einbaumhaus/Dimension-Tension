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
			Global.next_scene = "res://3D_levels/level_3/level_3_3d.tscn"
			get_tree().change_scene_to_packed(Global.loading_screen)
