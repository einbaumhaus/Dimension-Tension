extends AudioStreamPlayer
@onready var ev_tt : AudioStreamOggVorbis = preload("res://audio/voicelines/take.ogg")
func take():
	set_stream(ev_tt)
	play()
