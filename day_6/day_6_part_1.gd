@tool
class_name TrashCompactorPartOne
extends EditorScriptTimed

var path: String = "res://day_6/input.txt"
var problems: Array[PackedStringArray] = []
var total: int

func _on_run() -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")
	
	while not file.eof_reached():
		var line: String = file.get_line().strip_edges()
		if not line.is_empty():
			var values: PackedStringArray = line.split(" ", false)
			problems.append(values)
	
	for problem in problems[0].size():
		var final_array: PackedStringArray = problems[-1]
		var operator: String = final_array[problem]
		var numbers: PackedStringArray = []
		var p_total: int = 0
		
		for i in problems.size() - 1:
			var number: String = problems[i][problem]
			numbers.append(number)
			
		for n in numbers:
			match operator:
				"*":
					if p_total == 0:
						p_total = int(n)
					else:
						p_total *= int(n) 
				"+":
					if p_total == 0:
						p_total = int(n) 
					else:
						p_total += int(n) 
		
		total += p_total

	print(total)
