extends BaseRule

const NUMBER_GROUP = 2

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconG.png[/img] neighbours must be the same"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []

	var gArray = get_index_of_type(Ficha.Tipo.G)
	if gArray.size() == 0:
		return []
		
	for gValue in gArray:
		if gValue == 0 or gValue + 1 == pieces_length():
			error_fichas.append(get_piece(gValue))
		elif get_piece(gValue-1).tipo != get_piece(gValue+1).tipo:
			error_fichas.append(get_piece(gValue))
	
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,9)
	
	return error_fichas
	
func registerWrongPairings(count, current_index,error_list, listGroup):
	count -= (count / NUMBER_GROUP) * NUMBER_GROUP
	if count % NUMBER_GROUP != 0:
		for i in range(count):
			error_list.append(get_piece(listGroup[current_index - i]))
