extends AudioStreamPlayer

@onready var ev_th : AudioStreamOggVorbis = preload("res://audio/voicelines/trickshot.ogg")
func trickshot():
	set_stream(ev_th)
	play()
