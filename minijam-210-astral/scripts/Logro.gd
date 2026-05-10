class_name Logro


var parts:Array[bool]

func _init(partsNum):
	parts = []
	for i in partsNum:
		parts.append(false)

func isDone():
	for p in parts:
		if not p:
			return false;
	return true;
