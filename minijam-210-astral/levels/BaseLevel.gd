class_name BaseLevel extends RefCounted
const SPACER = preload("uid://c8jcc5y7w1h2k")

var spacer: SPACER
var current_level = -1

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			pass
		1:
			pass
		2:
			pass
	return []

func next_level():
	current_level += 1
	if is_complete():
		return
	spacer.add_pieces(level_steps(current_level))

func empty_spacer():
	spacer.remove_pieces(
		arrayFichaTipo(
			spacer.pieces.map(func (el): return el.tipo)
		),
		false
	)
	
func arrayFichaTipo(array:Array):
	return Array(
		array,
		TYPE_INT,
		"",
		Ficha.Tipo
	)

func max_level():
	return 3

func is_complete():
	return current_level > max_level()
