extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			empty_spacer()
			return arrayFichaTipo([
					Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A,
					Ficha.Tipo.G,
					Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F,
					Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.C,
					Ficha.Tipo.B]
			)
			spacer.pieces[6].nailed = true
	return []

func max_level():
	return 0
