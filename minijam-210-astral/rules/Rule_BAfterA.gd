extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconB.png[/img] must be after [img width=32 color=BLACK]res://assets/img/TinyIconA.png[/img]"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha]
	
	for index_ficha in get_index_of_type(Ficha.Tipo.B):
		if not isBAfterA(index_ficha):
			error_fichas.append(arrayPieces[index_ficha])
		
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,4)
	return error_fichas
	
func isBAfterA(bIndex:int) -> bool:
	return bIndex > 0 and arrayPieces[bIndex - 1].tipo == Ficha.Tipo.A or get_piece(bIndex).anulled
