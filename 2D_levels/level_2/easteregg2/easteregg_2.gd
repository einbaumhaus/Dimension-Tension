extends Node

@onready var cutscene: AnimationPlayer = $cutscene
@onready var enemikes: Node2D = $enemikes
@onready var player: CharacterBody2D = $player_topdown
@onready var bubbles: Node2D = $enemikes/bubbles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene.play("intro")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cutscene_animation_finished(anim_name: StringName) -> void:
	enemikes.process_mode = Node.PROCESS_MODE_ALWAYS
	player.process_mode = Node.PROCESS_MODE_ALWAYS
	bubbles.visible = false
