@tool
class_name SecretEntrance
extends EditorScriptTimed
## Advent of Code 2025 - Day 1: Secret Entrance
## https://adventofcode.com/2025/day/1

const START: int = 50

var path: String = "res://day_1/input.txt"

func _on_run() -> void:

	var file = FileAccess.open(path,FileAccess.READ)
	assert(file, "Failed to read file.")

	var dial: int = START
	var p_1: int = 0
	var p_2: int = 0

	while not file.eof_reached():
		var line: String = file.get_line().strip_edges()
		var dir: int = -1 if line.begins_with("L") else 1
		var steps: int = int(line.erase(0,1))

		for step in steps:
			dial = wrapi(dial + dir, 0, 100)
			if dial == 0:
				p_2 +=1

		if dial == 0:
			p_1 +=1

	print("Part one: %d" % p_1)
	print("Part two: %d" % p_2)
	return
