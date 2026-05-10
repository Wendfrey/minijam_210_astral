extends Node
signal logroUpdate(num:int)

var levels:Array[int] = [0,0,0,0,0,0]
var logros:Array[Logro] = []

func _ready():
	logros.append(Logro.new(1))

func checkDoneLogro(numLogro, numPart):
	if logros[numLogro].isDone():
		return
	logros[numLogro].parts[numPart] = true
	if logros[numLogro].isDone():
		logroUpdate.emit(numLogro)
