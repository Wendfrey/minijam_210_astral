class_name BaseRule extends RefCounted

var arrayPieces:Array[Ficha] = []
var indexPieces:Array[int] = []
var rule_name = "Default Name"
var rule_description = "Default Description"
var is_active:bool = true

func check_rules(pArrayPieces:Array[Ficha]) -> Array[Ficha]:
	if not is_active:
		return []
	arrayPieces = pArrayPieces
	indexPieces = Array(
		range(arrayPieces.size()),
		TYPE_INT,
		"",
		null
	)
	return _check_rules_internal()
	
func _check_rules_internal() -> Array[Ficha]:
	return []

func get_index_of_type(filtro: Ficha.Tipo) -> Array[int]:
	return indexPieces.filter(func (element:int): return arrayPieces[element].tipo == filtro)

func get_piece(index) -> Ficha:
	return arrayPieces[index]

##Aqui se obtendria que error ha dado si es que ha dado alguno
func get_error():
	pass
