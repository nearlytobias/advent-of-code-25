@tool
class_name PrintingDepartmentPartTwo
extends EditorScriptTimed

var path: String = "res://day_4/input.txt"
var grid: Array [Array] = []
var continue_loop: bool = true

func _on_run() -> void:
	grid.clear()
	
	var file = FileAccess.open(path, FileAccess.READ)
	assert(file, "Failed to read file.")
	
	while not file.eof_reached():
		var line : String = file.get_line().strip_edges()
		var row: Array = []
		for i in line:
			row.append(i)
		grid.append(row)
		
	var tp_total: int = 0
	var tp_accessible: int = 1
	
	while tp_accessible > 0:
		var next_grid : Array = grid.duplicate(true)
		tp_accessible = 0
		for i in grid.size():
			var row : Array = grid[i]
			var next_row: Array = next_grid[i]
			var above_row: Array
			var below_row: Array
			for n in row.size():
				var tp_adjacent: int = 0
				if row[n] == "@":
					
					if i > 0:
						above_row = grid[i - 1]
						if not above_row.is_empty():
							if n > 0:
								if above_row[n - 1] == "@":
									tp_adjacent +=1
							if above_row[n] == "@":
								tp_adjacent +=1
							if n < row.size() - 1:
								if above_row[n + 1] == "@":
									tp_adjacent +=1
					
					if n > 0:
						if row[n - 1] == "@":
							tp_adjacent +=1
					if n < row.size() - 1:
						if row[n + 1] == "@":
							tp_adjacent +=1
					
					if i != grid.size() - 1:
						below_row = grid [i + 1]
						if not below_row.is_empty():
							if n > 0:
								if below_row[n - 1] == "@":
									tp_adjacent +=1
							if below_row[n] == "@":
								tp_adjacent +=1
							if n < row.size() - 1:
								if below_row[n + 1] == "@":
									tp_adjacent +=1
					
					if tp_adjacent < 4:
						tp_accessible += 1
						tp_total += 1
						next_row[n] = "."	
						
		grid = next_grid
		
	print(tp_total)
