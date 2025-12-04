@tool
class_name LobbyPartOne
extends EditorScript
## Advent of Code 2025 - Day 3: Lobby
## https://adventofcode.com/2025/day/3

enum Part{ ONE, TWO }
var mode = Part.TWO

var path: String = "res://day_3/input.txt"
var total: int


func _run() -> void:

	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")

	match mode:

		Part.ONE:

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


		Part.TWO:

			while not file.eof_reached():

				const BATTERIES: int = 12
				var bank : String = file.get_line().strip_edges()
				var pos: int = 0
				var num: String = ""
				var _buffer: int = BATTERIES

				for b in BATTERIES:
					var highest: int = 0
					for i in range(pos, (bank.length() - (_buffer - 1))):
						var cursor : int = int(bank[i])
						if cursor > highest:
							highest = cursor
							pos = i + 1

					num += str(highest)
					_buffer -= 1

				total += int(num)

	print(total)
