extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]The 1st and 9th spaces must have a different sigil"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	if arrayPieces.size() < 9:
		return []
	
	var firstPiece = get_piece(0)
	var ninthPiece = get_piece(8)
	if firstPiece.tipo == ninthPiece.tipo:
		error_fichas.append(firstPiece)
		error_fichas.append(ninthPiece)
	
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,1)
	return error_fichas
