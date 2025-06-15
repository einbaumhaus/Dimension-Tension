extends Node

@onready var player: CharacterBody2D = $player_topdown

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var launcher = player.get_child(2)
	launcher.visible = false
	launcher.process_mode = Node.PROCESS_MODE_DISABLED
	player.launcher_active = false
	MusicPlayer.tonband1()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
