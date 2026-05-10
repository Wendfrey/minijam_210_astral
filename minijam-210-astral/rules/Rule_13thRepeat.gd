extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK]The sigil of 13th position can't be the same as last position"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	
	if arrayPieces.size() < 14:
		return []
	
	var thirteentPiece = get_piece(12)
	var lastPiece = get_piece(-1)
	if thirteentPiece.tipo == lastPiece.tipo:
		error_fichas.append(thirteentPiece)
	
	if error_fichas.size() > 0:
		PlayerProgess.checkDoneLogro(8,3)
	return error_fichas
