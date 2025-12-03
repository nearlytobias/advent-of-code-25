@tool
class_name Lobby
extends EditorScript
## Advent of Code 2025 - Day 3: Lobby
## https://adventofcode.com/2025/day/3

var path: String = "res://day_3/input.txt"
var total: int


func _run() -> void:

	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")


	while not file.eof_reached():
		var bank : String = file.get_line().strip_edges()
		var l: int = 0
		var r: int = 0
		var l_pos: int

		for i in bank.length() - 1:
			var cursor : int = int(bank[i])
			if cursor > l:
				l = cursor
				l_pos = i

		for i in range(l_pos + 1, bank.length()):
			var cursor: int = int(bank[i])
			if cursor > r:
				r = cursor


		var num: int = (l*10) + r
		total += num

	print(total)
