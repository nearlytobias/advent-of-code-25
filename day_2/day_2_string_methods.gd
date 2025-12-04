@tool
class_name GiftShopStringMethods
extends EditorScriptTimed
## Advent of Code 2025 - Day 2: Gift Shop
## https://adventofcode.com/2025/day/2
## String method faster for Part 2

enum Part{ ONE, TWO }
var mode = Part.TWO
var path: String = "res://day_2/input.txt"
var invalid_ids: Array = []
var total: int

func _on_run() -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")
	var contents = file.get_as_text().strip_edges()
	var ranges: Array = contents.split(",")
	var id_pair: Array = []
	var upper: int
	var lower: int

	match mode:
		Part.ONE:
			for ids in ranges:
				id_pair = ids.split("-")
				lower = int(id_pair[0])
				upper = int(id_pair[1])
				for i in range(lower, (upper + 1)):
					var id_str: String = str(i)
					var size: int = id_str.length()

					if size % 2 != 0: ## Skip odd IDS
						continue

					var mid: int = size / 2
					var one: String = id_str.substr(0, mid)
					var two: String = id_str.substr(mid, mid)

					if one == two:
						invalid_ids.append(i)
						total += i
		Part.TWO:
			for ids in ranges:
				id_pair = ids.split("-")
				lower = int(id_pair[0])
				upper = int(id_pair[1])
				for i in range(lower, (upper + 1)):
					var id_str: String = str(i)
					var size: int = id_str.length()
					var found_match: bool = false

					for length in range(1, (size / 2) + 1):
						if size % length != 0:
							continue

						var sample: String = id_str.substr(size - length, length)
						var valid_id: bool = false

						for pos in range(0, size - length, length):
							var chunk: String = id_str.substr(pos, length)
							if chunk != sample:
								valid_id = true
								break

						if not valid_id:
							invalid_ids.append(i)
							total += i
							found_match = true
							break

					if found_match:
						break

	print("Total: %s" % total)
	return
