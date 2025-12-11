@tool
class_name CafeteriaPartOne
extends EditorScriptTimed

enum DataType {RANGE, ID}
var current_data_type: DataType = DataType.RANGE
var path: String = "res://day_5/input.txt"
var ranges: Array[PackedStringArray] = []
var ids : Array[String]
var valid_ids: int = 0

func _on_run() -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	ranges.clear()
	ids.clear()
	
	while not file.eof_reached():
		var line : String = file.get_line().strip_edges()
		
		if line.is_empty():
			current_data_type = DataType.ID
			
		match current_data_type:
			DataType.RANGE:
				if not line.is_empty():
					ranges.append(line.split("-"))
				
			DataType.ID:
				if not line.is_empty():
					ids.append(line)
				
	for i in ids.size():
		var line: String = ids.get(i)
		for r in ranges.size():
			var lower: String = ranges[r].get(0)
			var higher: String = ranges[r].get(1)
			if int(line) >= int(lower) and int(line) <= int(higher):
				valid_ids +=1
				break
				
	print(valid_ids)
