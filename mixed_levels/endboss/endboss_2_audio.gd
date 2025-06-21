extends AudioStreamPlayer
@onready var lk_ml : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/meaningless.ogg")
@onready var ev_on : AudioStreamOggVorbis = preload("res://audio/voicelines/ohno.ogg")
@onready var ev_noo : AudioStreamOggVorbis = preload("res://audio/voicelines/noooo.ogg")
@onready var lk_wb : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/welcome.ogg")
func meaningless():
	set_stream(lk_ml)
	play()
func ohno():
	set_stream(ev_on)
	play()

func noooo():
	set_stream(ev_noo)
	play()
func welcome():
	set_stream(lk_wb)
	play()
