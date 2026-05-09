extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32]res://assets/img/TinyIconB.png[/img] must be following [img width=32]res://assets/img/TinyIconA.png[/img]"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha]
	
	for index_ficha in get_index_of_type(Ficha.Tipo.B):
		if not isBAfterA(index_ficha):
			error_fichas.append(arrayPieces[index_ficha])
		
	return error_fichas
	
func isBAfterA(bIndex:int) -> bool:
	return bIndex > 0 and arrayPieces[bIndex - 1].tipo == Ficha.Tipo.A
