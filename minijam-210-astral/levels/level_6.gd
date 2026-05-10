extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			empty_spacer()
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.E])
		1:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.F])
		2:
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.E])
		3:
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.G])
		4:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.E])
		_:
			return []

func max_level():
	return 4
