@tool
extends EditorScript


const MIN: int = 0
const START: int = 50
const MAX: int = 99

var path: String = "res://day_1/input.txt"
var password: int = 0
var dial: int = START

func _run() -> void:
	
	if not FileAccess.file_exists(path):
		return
		
	var file = FileAccess.open(path,FileAccess.READ)

	while file.get_position() < file.get_length():
		var rotation: String = file.get_line()
		if rotation.begins_with("L"):
			for i in int(rotation.erase(0,1)):
				dial -=1
				if dial < MIN:
					dial = MAX
				if dial == MIN:
					password +=1
		else:
			for i in int(rotation.erase(0,1)):
				dial +=1
				if dial > MAX:
					dial = MIN
				if dial == MIN:
					password+=1
				
				
	print("Password: %d" % password)
