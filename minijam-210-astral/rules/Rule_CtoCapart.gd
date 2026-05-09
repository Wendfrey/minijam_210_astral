extends BaseRule

func _init() -> void:
	rule_name = "[color=BLACK][img width=32]res://assets/img/TinyIconC.png[/img] must be exactly 2 apart from [img width=32]res://assets/img/TinyIconC.png[/img]"

func _check_rules_internal() -> Array[Ficha]:
	var result:Array[Ficha] = []
	
	var indexesOfC = get_index_of_type(Ficha.Tipo.C)
	
	if indexesOfC.is_empty():
		return []
	
	var i = 0
	while(i < indexesOfC.size()):
		if i +1 < indexesOfC.size() and checkDifference(indexesOfC[i], indexesOfC[i+1]):
			pass
		elif i > 0 and checkDifference(indexesOfC[i], indexesOfC[i-1]):
			pass
		else:
			result.append(arrayPieces[indexesOfC[i]])
		i += 1
	
	return result
	
func checkDifference(indexA, indexB):
	return abs(indexA - indexB) == 3
