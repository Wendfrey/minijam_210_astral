extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconF.png[/img] can't be more than 3 spaces separated from [img width=32 color=BLACK]res://assets/img/TinyIconC.png[/img]"

func _check_rules_internal() -> Array[Ficha]:
	var error_fichas:Array[Ficha] = []
	var listF = get_index_of_type(Ficha.Tipo.F)
	var listC = get_index_of_type(Ficha.Tipo.C)
	for elementD in listF:
		if not listC.any(func (elementC): return abs(elementD - elementC) <= 2):
			error_fichas.append(arrayPieces[elementD])
	
	return error_fichas
