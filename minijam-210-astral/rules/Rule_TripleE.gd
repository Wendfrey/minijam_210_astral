extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32]res://assets/img/TinyIconE.png[/img] must come in triplets"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []

	var eArray = get_index_of_type(Ficha.Tipo.E)
	if eArray.size() == 0:
		return []
		
	eArray.sort()
	var index_ficha = 0
	var count = 1
	while(index_ficha < eArray.size()):
		if index_ficha + 1 < eArray.size() and eArray[index_ficha] + 1 == eArray[index_ficha+1]:
			count += 1
		elif index_ficha + 1 < eArray.size():
			if count % 3 == 0:
				for i in range(count):
					error_fichas.append(get_piece(eArray[index_ficha-i]))
			count = 1
		index_ficha += 1
		
	if count % 3 == 0:
		for i in range(count):
			error_fichas.append(get_piece(eArray[eArray.size()-1-i]))

	return error_fichas
