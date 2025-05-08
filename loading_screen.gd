extends Control
class_name LoadingScreen

## This is emitted when the scene is finished loading.
## Use `ResourceLoader.load_threaded_get(path)` to get the scene.
signal scene_loaded(path: String)

@onready var progress_bar = $ProgressBar

## The path to the scene that's actually being loaded
var path: String

## Actual progress value; we move towards towards this
var progress_value := 0.0


## Load the scene at the given path.
## When this is finished loading, the "scene_loaded" signal will be emitted.
func load(path_to_load: String):
	path = path_to_load
	ResourceLoader.load_threaded_request(path)


func _process(delta: float):
	if not path:
		return

	var progress = []
	var status = ResourceLoader.load_threaded_get_status(path, progress)

	if status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_IN_PROGRESS:
		progress_value = progress[0] * 100
		progress_bar.value = move_toward(progress_bar.value, progress_value, delta * 20)

	if status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_LOADED:
		# zip the progress bar to 100% so we don't get weird visuals
		progress_bar.value = move_toward(progress_bar.value, 100.0, delta * 150)

		# "done" loading :)
		if progress_bar.value >= 99:
			scene_loaded.emit(path)
