extends Node
signal logroUpdate(num:int)

var levels:Array[int] = [0,0,0,0,0,0]
var logros:Array[Logro] = []

func _ready():
	logros.append(Logro.new(1)) #Mirar las estrellas
	logros.append(Logro.new(1)) #Abrir la ventana Status
	logros.append(Logro.new(1)) #Abrir un nivel
	logros.append(Logro.new(1)) #Completar 3 pasos en un nivel
	logros.append(Logro.new(1)) #Completar los 6 pasos de un nivel
	logros.append(Logro.new(6)) #Completar 2 pasos en los 6 niveles
	logros.append(Logro.new(7)) #Descubrir todos los sigils
	logros.append(Logro.new(1)) #Que se active el efecto del Secret lover
	logros.append(Logro.new(11)) #Haber hecho check con todas las reglas rotas
	logros.append(Logro.new(5)) #Ir muchas veces a la ventana
	logros.append(Logro.new(3)) #Abrir muchas veces Status
	logros.append(Logro.new(1)) #esperar un rato mirando las estrellas
	logros.append(Logro.new(6)) #Completar los 6 niveles
	

func checkDoneLogro(numLogro, numPart):
	if logros[numLogro].isDone():
		return
	logros[numLogro].parts[numPart] = true
	if logros[numLogro].isDone():
		logroUpdate.emit(numLogro)
