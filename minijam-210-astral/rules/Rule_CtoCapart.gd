extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32]res://assets/img/TinyIconC.png[/img] must have another [img width=32]res://assets/img/TinyIconC.png[/img] 2 spaces away but never closer"

func _check_rules_internal() -> Array[Ficha]:
	var result:Array[Ficha] = []
	
	var indexesOfC = get_index_of_type(Ficha.Tipo.C)
	
	if indexesOfC.is_empty():
		return []
		
	
	for indexC in indexesOfC:
		if (indexC < 2 or get_piece(indexC-3).tipo != Ficha.Tipo.C) and (indexC > arrayPieces.size() - 4 or get_piece(indexC+3).tipo != Ficha.Tipo.C):
			result.append(get_piece(indexC))
			continue
		for i in range(-2, 3):
			var indexCheck = i + indexC
			if indexCheck < 0 or indexCheck >= arrayPieces.size():
				continue
			if i != 0 and get_piece(indexC + i).tipo == Ficha.Tipo.C:
				result.append(get_piece(indexC))
				break
	return result
	
func checkDifference(indexA, indexB):
	return abs(indexA - indexB) == 3
