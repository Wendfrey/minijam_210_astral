extends BaseRules

func check_rules(pArrayPieces:Array[Ficha]) -> bool:
	super.check_rules(pArrayPieces)
	
	if not get_index_of_type(Ficha.Tipo.B).all(isBAfterA):
		return false
	
	return true
	
func isBAfterA(bIndex:int) -> bool:
	return bIndex > 0 and arrayPieces[bIndex - 1].tipo == Ficha.Tipo.A
