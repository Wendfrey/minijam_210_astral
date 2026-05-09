extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]The 1st and 10th spaces must have the same sigil"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	if arrayPieces.size() < 10:
		return []
	
	var firstPiece = get_piece(0)
	var tenthPiece = get_piece(9)
	if firstPiece.tipo != tenthPiece.tipo:
		error_fichas.append(firstPiece)
		error_fichas.append(tenthPiece)
	
	return error_fichas
