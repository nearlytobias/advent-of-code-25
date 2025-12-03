@tool
class_name GiftShop
extends EditorScript
## Advent of Code 2025 - Day Two: Gift Shop
## https://adventofcode.com/2025/day/2

var path: String = "res://day_2/input.txt"
var invalid_ids: Array = []
var total: int

func _run() -> void:

	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")

	var contents = file.get_as_text().strip_edges()
	var ranges: Array = contents.split(",")

	for ids in ranges:
		var id_pair : Array = ids.split("-")
		var lower: int = int(id_pair[0])
		var upper: int = int(id_pair[1])

		for i in range(lower, (upper+1)):
			var size : int = floori(log(i) / log(10)) + 1
			if size % 2 != 0: ## Skip odd IDS
				continue

			var divider: int = int(pow(10.0, size / 2))
			var one: int = i / divider
			var two: int = i % divider

			if one == two:
				invalid_ids.append(i)
				total += i

	print("Total: %s" % total)
