@tool
@abstract class_name EditorScriptTimed
extends EditorScript

var start: int
var duration: int

func _run() -> void:
	start = Time.get_ticks_usec()
	_on_run()
	duration = Time.get_ticks_usec() - start

	# Format output based on duration
	if duration < 1000:
		print("Completed in: %d μs %s" % [duration, self])
	elif duration < 1_000_000:
		print("Completed in: %.2f ms %s" % [duration / 1000.0, self])
	else:
		print("Completed in: %.2f s %s" % [duration / 1_000_000.0, self])

## Execute script here
## Make sure to return explicitly (for timer accuracy)
@abstract func _on_run() -> void
