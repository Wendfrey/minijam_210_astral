extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]The 13st and the last space must have different sigils"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	if arrayPieces.size() < 14:
		return []
	
	var thirteentPiece = get_piece(12)
	var lastPiece = get_piece(-1)
	if thirteentPiece.tipo == lastPiece.tipo:
		error_fichas.append(thirteentPiece)
		error_fichas.append(lastPiece)
	
	return error_fichas
