extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]The sigil of 10th space must be the same as 1st space"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	if arrayPieces.size() < 10:
		return []
	
	var firstPiece = get_piece(0)
	var tenthPiece = get_piece(9)
	if firstPiece.tipo != tenthPiece.tipo:
		error_fichas.append(tenthPiece)
	
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,2)
	return error_fichas
