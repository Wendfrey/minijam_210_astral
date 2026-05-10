extends Node

@export var spacer:NodePath
@onready var nodeSpacer = get_node(spacer)

var current_level = 0

func _ready() -> void:
	current_level = -1
	next_level()

func next_level():
	current_level += 1
	match (current_level):
		0:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.A, Ficha.Tipo.A]))
		1:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.B]))
		2:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A]))
		3:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.A]))
		4:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.C]))
		5:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.D,Ficha.Tipo.B]))
		6:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F]))
		7:
			empty_spacer()
			nodeSpacer.add_pieces(
				arrayFichaTipo([
					Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A,
					Ficha.Tipo.G,
					Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F,
					Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.C,
					Ficha.Tipo.B])
			)
			nodeSpacer.pieces[6].nailed = true

func arrayFichaTipo(array:Array):
	return Array(
		array,
		TYPE_INT,
		"",
		Ficha.Tipo
	)

func _on_rules_checker_result(result:bool) -> void:
	if result:
		next_level()
		
func empty_spacer():
	nodeSpacer.remove_pieces(
		arrayFichaTipo(
			nodeSpacer.pieces.map(func (el): return el.tipo)
		)
	)
