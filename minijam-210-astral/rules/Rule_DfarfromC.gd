extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconD.png[/img] next to [img width=32 color=BLACK]res://assets/img/TinyIconC.png[/img]"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	var listD = get_index_of_type(Ficha.Tipo.D)
	var listC = get_index_of_type(Ficha.Tipo.C)
	for elementD in listD:
		if listC.any(func (elementC): return abs(elementD - elementC) <= 1):
			error_fichas.append(arrayPieces[elementD])
	
	return error_fichas
