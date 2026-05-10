extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconE.png[/img] position must be multiple of 3"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha]
	
	for index_ficha in get_index_of_type(Ficha.Tipo.E):
		if (index_ficha+1)%3 != 0:
			error_fichas.append(arrayPieces[index_ficha])
	
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,7)
	
	return error_fichas
	
