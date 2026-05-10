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

func level_1_next_level():
	current_level += 1
	match (current_level):
		0:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.F, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.C, Ficha.Tipo.C]))
			nodeSpacer.pieces[-2].nailed = true
		1:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.G, Ficha.Tipo.A]))
		2:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.A]))
		2:
			nodeSpacer.add_pieces(arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.F, Ficha.Tipo.F]))
		3:
			nodeSpacer.remove


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
		
