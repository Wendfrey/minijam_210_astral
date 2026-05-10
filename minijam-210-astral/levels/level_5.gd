extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			empty_spacer()
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil A
			PlayerProgess.checkDoneLogro(6,6) #Descubre sigil G
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A, Ficha.Tipo.G])
		1:
			PlayerProgess.checkDoneLogro(6,1) #Descubre sigil B
			PlayerProgess.checkDoneLogro(6,3) #Descubre sigil D
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.B, Ficha.Tipo.D])
		2:
			PlayerProgess.checkDoneLogro(5,4) #Completa 2 pasos
			return arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.A, Ficha.Tipo.A])
		3:
			PlayerProgess.checkDoneLogro(6,6) #Descubre sigil G
			PlayerProgess.checkDoneLogro(3,0) #Completa 3 pasos
			return arrayFichaTipo([Ficha.Tipo.G, Ficha.Tipo.D])
		4:
			PlayerProgess.checkDoneLogro(6,2) #Descubre sigil B
			PlayerProgess.checkDoneLogro(6,4) #Descubre sigil D
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.B, Ficha.Tipo.E])
		_:
			return []

func max_level():
	return 4
