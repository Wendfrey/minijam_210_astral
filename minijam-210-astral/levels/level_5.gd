extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			empty_spacer()
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.G])
		1:
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.B, Ficha.Tipo.D])
		2:
			return arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.A, Ficha.Tipo.A])
		3:
			return arrayFichaTipo([Ficha.Tipo.G, Ficha.Tipo.D])
		4:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.B, Ficha.Tipo.E])
		_:
			return []

func max_level():
	return 5
