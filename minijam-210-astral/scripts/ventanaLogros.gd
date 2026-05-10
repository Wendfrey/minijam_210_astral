extends Panel

@export var listado: VBoxContainer
@export var logros: Array[String]
@export var pistas: Array[String]

func _ready():
	var template= getLogroPanel(0);
	for l in logros:
		var newPanel = template.duplicate()
		(newPanel.get_child(1) as Label).text = l
		listado.add_child(newPanel)
	getLogroPanel(1).visible = true;
	listado.get_child(0).queue_free()
	PlayerProgess.logroUpdate.connect(logroUpdated)
	
func getLogroPanel(num):
	return listado.get_child(num) as Panel;

func logroUpdated(num):
	var elPanel = getLogroPanel(0)
	elPanel.theme = load("res://assets/prefab/logroEnabled.tres")
	pass
