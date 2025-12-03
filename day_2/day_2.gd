@tool
class_name GiftShop
extends EditorScript
## Advent of Code 2025 - Day 2: Gift Shop
## https://adventofcode.com/2025/day/2

enum Mode{ PART_ONE, PART_TWO }
var mode = Mode.PART_TWO

var path: String = "res://day_2/input.txt"
var invalid_ids: Array = []
var total: int

func _run() -> void:

	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")

	var contents = file.get_as_text().strip_edges()
	var ranges: Array = contents.split(",")

	var id_pair: Array = []
	var upper: int
	var lower: int

	match mode:
		Mode.PART_ONE:

			for ids in ranges:
				id_pair = ids.split("-")
				lower = int(id_pair[0])
				upper = int(id_pair[1])

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

		Mode.PART_TWO:

			for ids in ranges:
				id_pair = ids.split("-")
				lower = int(id_pair[0])
				upper = int(id_pair[1])

				for i in range(lower, (upper + 1)):

					var size : int = floori(log(i) / log(10)) + 1

					for length in range(1, (size / 2) + 1):
						if size % length != 0:
							continue

						var divider: int = int(pow(10.0, length))
						var sample: int = i % divider
						var remaining: int = i / divider

						var valid_id: bool = false

						while remaining > 0:
							if not sample == remaining % divider:
								valid_id = true
								break
							remaining /= divider

						if not valid_id:
							invalid_ids.append(i)
							total += i
							break

	print("Total: %s" % total)
