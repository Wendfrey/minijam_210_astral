class_name BaseLevel extends RefCounted
const SPACER = preload("uid://c8jcc5y7w1h2k")

var spacer: SPACER

func _init(pSpacer: SPACER) -> void:
	spacer = pSpacer

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			pass
		1:
			pass
		2:
			pass
	return []

func empty_spacer():
	spacer.remove_pieces(
		arrayFichaTipo(
			spacer.pieces.map(func (el): return el.tipo)
		)
	)
	
func arrayFichaTipo(array:Array):
	return Array(
		array,
		TYPE_INT,
		"",
		Ficha.Tipo
	)
