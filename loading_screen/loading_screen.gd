extends Control

var use_threaded_loading := true
var progress := [0.0]

func _ready() -> void:
	if OS.has_feature("web"):  # detect HTML5/Web
		use_threaded_loading = false
		load_scene_non_threaded()
	else:
		ResourceLoader.load_threaded_request(Global.next_scene)

func _process(delta: float) -> void:
	if use_threaded_loading:
		var status = ResourceLoader.load_threaded_get_status(Global.next_scene, progress)
		$progress_bar.value = progress[0] * 100
		$progress_number.text = str(int(progress[0] * 100)) + "%"

		if progress[0] == 1.0:
			var packed_scene = ResourceLoader.load_threaded_get(Global.next_scene)
			get_tree().change_scene_to_packed(packed_scene)

func load_scene_non_threaded() -> void:
	# fallback for Web: show 0%, then load everything directly
	$progress_bar.value = 0
	$progress_number.text = "Loading..."
	await get_tree().process_frame  # Let the UI update
	var packed_scene = load(Global.next_scene)
	get_tree().change_scene_to_packed(packed_scene)
