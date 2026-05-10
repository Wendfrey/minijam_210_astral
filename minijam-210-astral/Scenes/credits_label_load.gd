extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file:FileAccess = FileAccess.open("res://licenses.txt", FileAccess.READ)
	text = file.get_as_text()
	file.close()
