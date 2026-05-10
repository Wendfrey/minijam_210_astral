extends BaseRule

const NUMBER_GROUP = 2

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconG.png[/img] must come in pairs"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []

	var eArray = get_index_of_type(Ficha.Tipo.G)
	if eArray.size() == 0:
		return []
		
	eArray.sort()
	var index_ficha = 0
	var count:int = 1
	while(index_ficha < eArray.size()):
		if index_ficha + 1 < eArray.size() and eArray[index_ficha] + 1 == eArray[index_ficha+1]:
			count += 1
		elif index_ficha + 1 < eArray.size():
			registerWrongPairings(count, index_ficha, error_fichas, eArray)
			count = 1
		index_ficha += 1
		
	registerWrongPairings(count, index_ficha - 1, error_fichas, eArray)

	return error_fichas
	
func registerWrongPairings(count, current_index,error_list, listGroup):
	count -= (count / NUMBER_GROUP) * NUMBER_GROUP
	if count % NUMBER_GROUP != 0:
		for i in range(count):
			error_list.append(get_piece(listGroup[current_index - i]))
