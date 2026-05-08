class_name BaseRules extends RefCounted

var arrayPieces:Array[Ficha] = []
var indexPieces:Array[int] = []

func check_rules(pArrayPieces:Array[Ficha]) -> bool:
	arrayPieces = pArrayPieces
	indexPieces = Array(
		range(arrayPieces.size()),
		TYPE_INT,
		"",
		null
	)
	return false
	
	
func get_index_of_type(filtro: Ficha.Tipo) -> Array[int]:
	return indexPieces.filter(func (element:int): return arrayPieces[element].tipo == filtro)

##Aqui se obtendria que error ha dado si es que ha dado alguno
func get_error():
	pass
