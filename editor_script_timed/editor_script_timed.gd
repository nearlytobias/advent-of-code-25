@tool
@abstract class_name EditorScriptTimed
extends EditorScript

var start_time: int
var duration: int

func _run() -> void:
	start_time = Time.get_ticks_usec()
	_on_run()
	duration = Time.get_ticks_usec() - start_time

	# Format output based on duration
	if duration < 1000:
		print("%s completed in: %d μs" % [self, duration])
	elif duration < 1_000_000:
		print("%s completed in: %.2f ms" % [self, duration / 1000.0])
	else:
		print("%s completed in: %.2f s" % [self, duration / 1_000_000.0])

## Execute script here
## Make sure to return explicitly (for timer accuracy)
@abstract func _on_run() -> void
