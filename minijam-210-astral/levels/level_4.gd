extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.E])
		1:
			return arrayFichaTipo([Ficha.Tipo.D, Ficha.Tipo.B, Ficha.Tipo.A])
		2:
			return arrayFichaTipo([Ficha.Tipo.E, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A])
		3:
			return arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.G, Ficha.Tipo.D, Ficha.Tipo.B])
		_:
			return []

func max_level():
	return 3
