@tool
extends EditorScript

var path: String = "res://day_3/input.txt"
var total: int
#var digits: Array = []

func _run() -> void:

	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")


	while not file.eof_reached():
		var bank : int = int(file.get_line())
		var cursor: int
		var l: int = 0
		var r: int = bank % 10

		bank /=10

		while bank > 0:
			cursor = bank % 10
			if cursor > l:
				if l > r:
					r = l
				l = cursor
			bank /= 10

		var num: int = (l*10) + r
		#digits.append(num)
		total += num

	#print(digits)
	print(total)
