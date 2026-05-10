extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			empty_spacer()
			PlayerProgess.checkDoneLogro(6,2) #Descubre sigil C
			PlayerProgess.checkDoneLogro(6,4) #Descubre sigil E
			PlayerProgess.checkDoneLogro(6,5) #Descubre sigil F
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.E, Ficha.Tipo.F])
		1:
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil A
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.A])
		2:
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil B
			PlayerProgess.checkDoneLogro(5,2) #Completa 2 pasos
			return arrayFichaTipo([Ficha.Tipo.B])
		3:
			PlayerProgess.checkDoneLogro(3,0) #Completa 3 pasos
			return arrayFichaTipo([Ficha.Tipo.F])
		4:
			return arrayFichaTipo([Ficha.Tipo.C])
		5:
			return arrayFichaTipo([Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F])
	return []
