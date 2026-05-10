extends BaseRule

const NUMBER_GROUP = 2

func _init() -> void:
	rule_name = "[color=BLACK][img width=32 color=BLACK]res://assets/img/TinyIconG.png[/img] must come in pairs"

func _check_rules_internal() -> Array[Ficha]:
	var secret_lovers:Array[Ficha] = []

	var dArray = get_index_of_type(Ficha.Tipo.D)
	var bArray = get_index_of_type(Ficha.Tipo.B)
	dArray.sort()
	bArray.sort()
	
	var dIndex = 0
	var bIndex = 0
	while(dIndex < dArray.size() and bIndex < bArray.size()):
		var bValue = bArray[bIndex]
		var dValue = dArray[dIndex]
		if bValue >= dValue:
			dIndex += 1
		elif dValue - bValue > 1:
			get_piece(bValue).anulled = false
			bIndex += 1
		else:
			var bPiece = get_piece(bValue)
			bPiece.anulled = can_be_lovers(bValue)
			if bPiece.anulled:
				secret_lovers.append(bPiece)
			bIndex += 1
			dIndex += 1
			
	for i in range(bIndex, bArray.size()):
		get_piece(bArray[i]).anulled = false

	return secret_lovers

func can_be_lovers(bIndex):
	return bIndex == 0 or bIndex > 0 and get_piece(bIndex-1).tipo != Ficha.Tipo.A
