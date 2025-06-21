extends AudioStreamPlayer

@onready var ev_hey : AudioStreamWAV = preload("res://audio/voicelines/ev_hey.wav")
@onready var ev_ha : AudioStreamOggVorbis = preload("res://audio/voicelines/ev_howabout.ogg")
@onready var lk_fi : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/finally.ogg")
@onready var lk_dn : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/digin.ogg")
@onready var lk_no : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/no.ogg")
@onready var lk_dm : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/damnit.ogg")
@onready var lk_cb : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/thiscannotbe.ogg")
@onready var lk_tb : AudioStreamOggVorbis = preload("res://audio/voicelines/leakim/takeback.ogg")
func hey():
	set_stream(ev_hey)
	play()
func howabout():
	set_stream(ev_ha)
	play()
func finally():
	set_stream(lk_fi)
	play()
func digin():
	set_stream(lk_dn)
	play()
func no():
	set_stream(lk_no)
	play()
func damnit():
	set_stream(lk_dm)
	play()
func thiscb():
	set_stream(lk_cb)
	play()
func takeb():
	set_stream(lk_tb)
	play()
