extends Node

@onready var player: AudioStreamPlayer = $AudioStreamPlayer

var tonband = 0

func _ready() -> void:
	# Only keep the first instance of Music
	if Engine.is_editor_hint():
		return  # skip duplicate check in editor preview

	if MusicPlayer != self:
		queue_free()
	else:
		if not player.playing:
			player.play()


func tonband0():
	if tonband != 0:
		tonband = 0
		player.stream = preload("res://audio/music/Eine Kleine Nachtmusik – Mozart (No Copyright Music).mp3")
		player.play()
		print("playing mozart nachtmusilk")
	else:
		pass

func tonband1():
	if tonband != 1:
		tonband = 1
		player.stream = preload("res://audio/music/Bach-Toccata.ogg")
		player.play()
		print("playing bach toccata")
	else:
		pass

func tonband2():
	if tonband != 2:
		tonband = 2
		player.stream = preload("res://audio/music/Symphony No. 5 – Beethoven (No Copyright Music) [PbuC5WbodAs](1).mp3")
		player.play()
		print("playing beethoven no5")
	else:
		pass

func tonband3():
	if tonband != 3:
		tonband = 3
		player.stream = preload("res://audio/music/Winter - Vivaldi [COPYRIGHT FREE] .mp3")
		player.play()
		print("playing winter vivaldi")
	else:
		pass

func tonband4():
	if tonband != 4:
		tonband = 4
		player.stream = preload("res://audio/music/Paul Pitman - Moonlight Sonata Op. 27 No. 2.mp3")
		player.play()
		print("playing mozart moonlight sonata")
	else:
		pass

func tonband5():
	if tonband != 5:
		tonband = 5
		player.stream = preload("res://audio/music/Les Toreadors from Carmen – Bizet (No Copyright Music) [KOtcrIWzbQA].mp3")
		player.play()
		print("playing carmen bizet")
	else:
		pass

func tonband6():
	if tonband != 6:
		tonband = 6
		player.stream = preload("res://audio/music/TheFatRat - Xenogenesis (Outro Song).mp3")
		player.play()
		print("playing xenogenesis thefatrat")
	else:
		pass

func stop():
	player.stop()

func play():
	player.play()
