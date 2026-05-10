extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			return arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.A, Ficha.Tipo.A])
		1:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.B])
		2:
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A])
		3:
			return arrayFichaTipo([Ficha.Tipo.A])
		4:
			return arrayFichaTipo([Ficha.Tipo.C])
		5:
			return arrayFichaTipo([Ficha.Tipo.D,Ficha.Tipo.B])
		6:
			return arrayFichaTipo([Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F])
		_:
			return []
			
func max_level():
	return 6
