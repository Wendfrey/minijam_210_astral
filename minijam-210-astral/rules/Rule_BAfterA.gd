extends BaseRules

func check_rules(pArrayPieces:Array[Ficha]) -> Array[Ficha]:
	rule_name = "B must be after A"
	super.check_rules(pArrayPieces)
	var error_fichas:Array[Ficha]
	
	for index_ficha in get_index_of_type(Ficha.Tipo.B):
		if not isBAfterA(index_ficha):
			error_fichas.append(pArrayPieces[index_ficha])
		
	return error_fichas
	
	
func isBAfterA(bIndex:int) -> bool:
	return bIndex > 0 and arrayPieces[bIndex - 1].tipo == Ficha.Tipo.A
