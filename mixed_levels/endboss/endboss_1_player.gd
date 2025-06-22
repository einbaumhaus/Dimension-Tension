extends AudioStreamPlayer

@onready var ev_ye : AudioStreamOggVorbis = preload("res://audio/voicelines/yourend.ogg")
@onready var lk_yf : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/youfool.ogg")
@onready var lk_ct : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/cheaptricks.ogg")
@onready var lk_at : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/anything.ogg")

func yourend():
	set_stream(ev_ye)
	play()

func youfool():
	set_stream(lk_yf)
	play()

func cheaptricks():
	set_stream(lk_ct)
	play()

func anything():
	set_stream(lk_at)
	play()
