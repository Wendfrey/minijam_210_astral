extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil A
			PlayerProgess.checkDoneLogro(6,1) #Descubre sigil B
			PlayerProgess.checkDoneLogro(6,2) #Descubre sigil C
			PlayerProgess.checkDoneLogro(6,5) #Descubre sigil F
			PlayerProgess.checkDoneLogro(6,6) #Descubre sigil G
			PlayerProgess.checkDoneLogro(5,1) #Completa 2 pasos
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
