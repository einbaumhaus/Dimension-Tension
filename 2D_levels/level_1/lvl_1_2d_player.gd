extends AudioStreamPlayer
@onready var ev_ft : AudioStreamOggVorbis = preload("res://audio/voicelines/futile.ogg")
@onready var ev_ts : AudioStreamOggVorbis = preload("res://audio/voicelines/tension.ogg")
func futile():
	set_stream(ev_ft)
	play()

func tension():
	set_stream(ev_ts)
	play()
