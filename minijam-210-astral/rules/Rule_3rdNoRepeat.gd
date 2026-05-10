extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]The sigil on the 3rd space cannot be chained in any space"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	if arrayPieces.size() < 3:
		return []
	
	var unchained_symbol = get_piece(indexPieces[2]).tipo
	
	var symbolChainArray = get_index_of_type(unchained_symbol)
	
	for symbolIndex in range(symbolChainArray.size()-1):
		if abs(symbolChainArray[symbolIndex+1] - symbolChainArray[symbolIndex]) == 1:
			if not error_fichas.has(get_piece(symbolChainArray[symbolIndex])):
				error_fichas.append(get_piece(symbolChainArray[symbolIndex]))
			error_fichas.append(get_piece(symbolChainArray[symbolIndex+1]))
	
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,0)
		
	return error_fichas
