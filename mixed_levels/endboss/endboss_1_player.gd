extends AudioStreamPlayer

@onready var ev_ye : AudioStreamOggVorbis = preload("res://audio/voicelines/yourend.ogg")
@onready var lk_yf : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/youfool.ogg")
@onready var lk_ct : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/cheaptricks.ogg")
@onready var lk_at : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/anything.ogg")
@onready var ev_of : AudioStreamOggVorbis = preload("res://audio/voicelines/over.ogg")
@onready var ev_hg : AudioStreamOggVorbis = preload("res://audio/voicelines/highground.ogg")


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

func overfool():
	set_stream(ev_of)
	play()

func highground():
	set_stream(ev_hg)
	play()
