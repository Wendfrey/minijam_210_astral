extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			empty_spacer()
			PlayerProgess.checkDoneLogro(6,2) #Descubre sigil C
			PlayerProgess.checkDoneLogro(6,4) #Descubre sigil E
			PlayerProgess.checkDoneLogro(6,5) #Descubre sigil F
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.E])
		1:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.F])
		2:
			PlayerProgess.checkDoneLogro(5,5) #Completa 2 pasos
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil F
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.E])
		3:
			PlayerProgess.checkDoneLogro(6,6) #Descubre sigil G
			PlayerProgess.checkDoneLogro(3,0) #Completa 3 pasos
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.G])
		4:
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.E])
		_:
			return []

func max_level():
	return 4
