extends AudioStreamPlayer
@onready var ev_nb : AudioStreamOggVorbis = preload("res://audio/voicelines/noback.ogg")

func noback():
	set_stream(ev_nb)
	play()
