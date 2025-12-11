@tool
class_name Cafeteria
extends EditorScriptTimed

var path: String = "res://day_5/input.txt"
var ranges: Array[PackedStringArray] = []
var merged_ranges: Array[PackedStringArray] = []
var ids : Array[String]
var valid_ids: int = 0

func _on_run() -> void:
	
	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")
	
	while not file.eof_reached():
		var line : String = file.get_line().strip_edges()
			
		if not line.is_empty():
			ranges.append(line.split("-"))
		else:
			break
									
	ranges.sort_custom(sort_ranges)
	
	
	for r in range(ranges.size()):
		var current: PackedStringArray = ranges[r]
		var current_start: int = int(current[0])
		var current_end: int = int(current[1])
		
		if merged_ranges.is_empty() or current_start > int(merged_ranges.back()[1]) + 1:
			merged_ranges.append(current.duplicate())
		
		else:
			var last_merged: PackedStringArray = merged_ranges.back()
			var last_end: int = int(last_merged[1])
			
			if current_end > last_end:
				last_merged[1] = str(current_end)
					
	for mr in merged_ranges.size():
		valid_ids += (int(merged_ranges[mr].get(1)) - int(merged_ranges[mr].get(0)) + 1)
		
	print(valid_ids)
	
func sort_ranges(a, b):
	var a_low = int(a[0])
	var b_low = int(b[0])
	
	if a_low < b_low:
		return true
	elif a_low == b_low:
		return int(a[1]) < int(b[1]) 
	else:
		return false
