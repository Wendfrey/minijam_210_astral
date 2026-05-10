extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			PlayerProgess.checkDoneLogro(6,2) #Descubre sigil C
			PlayerProgess.checkDoneLogro(6,4) #Descubre sigil E
			PlayerProgess.checkDoneLogro(6,5) #Descubre sigil F
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.E])
		1:
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil A
			PlayerProgess.checkDoneLogro(6,1) #Descubre sigil B
			return arrayFichaTipo([Ficha.Tipo.D, Ficha.Tipo.B, Ficha.Tipo.A])
		2:
			PlayerProgess.checkDoneLogro(5,3) #Completa 2 pasos
			return arrayFichaTipo([Ficha.Tipo.E, Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.A])
		3:
			PlayerProgess.checkDoneLogro(6,3) #Descubre sigil D
			PlayerProgess.checkDoneLogro(6,6) #Descubre sigil G
			PlayerProgess.checkDoneLogro(3,0) #Completa 3 pasos
			return arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.G, Ficha.Tipo.D, Ficha.Tipo.B])
		_:
			return []

func max_level():
	return 3
