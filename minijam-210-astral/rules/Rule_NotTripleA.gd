extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]Triple [img width=32 color=BLACK]res://assets/img/TinyIconA.png[/img] is not allowed"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	for index_ficha in get_index_of_type(Ficha.Tipo.A):
		if index_ficha > 0 and index_ficha < arrayPieces.size()-1:
			if arrayPieces[index_ficha -1].tipo == Ficha.Tipo.A and arrayPieces[index_ficha +1].tipo == Ficha.Tipo.A:
				for i in range(-1, 2, 1):
					var piece = arrayPieces[index_ficha + i]
					if not error_fichas.has(piece):
						error_fichas.append(piece)

	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,10)
	
	return error_fichas
