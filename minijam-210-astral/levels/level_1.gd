extends BaseLevel

func level_steps(step:int) -> Array[Ficha.Tipo]:
	match (step):
		0:
			PlayerProgess.checkDoneLogro(6,0) #Descubre sigil A
			PlayerProgess.checkDoneLogro(6,1) #Descubre sigil B
			return arrayFichaTipo([Ficha.Tipo.B, Ficha.Tipo.A, Ficha.Tipo.A])
		1:
			PlayerProgess.checkDoneLogro(6,2) #Descubre sigil C
			return arrayFichaTipo([Ficha.Tipo.C, Ficha.Tipo.C, Ficha.Tipo.B])
		2:
			PlayerProgess.checkDoneLogro(5,0) #Completa 2 pasos
			return arrayFichaTipo([Ficha.Tipo.A, Ficha.Tipo.A])
		3:
			PlayerProgess.checkDoneLogro(3,0) #Completa 3 pasos
			return arrayFichaTipo([Ficha.Tipo.A])
		4:
			return arrayFichaTipo([Ficha.Tipo.C])
		5:
			PlayerProgess.checkDoneLogro(6,3) #Descubre sigil D
			return arrayFichaTipo([Ficha.Tipo.D,Ficha.Tipo.B])
		6:
			PlayerProgess.checkDoneLogro(6,5) #Descubre sigil F
			return arrayFichaTipo([Ficha.Tipo.F, Ficha.Tipo.F, Ficha.Tipo.F])
		_:
			return []
			
func max_level():
	return 6
