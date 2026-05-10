extends Panel

@export var listado: VBoxContainer
@export var logros: Array[String]
@export var pistas: Array[String]

func _ready():
	var template= getLogroPanel(0);
	for l in logros:
		var newPanel = template.duplicate()
		(newPanel.get_child(1) as Label).text = l
		newPanel.add_theme_stylebox_override("panel",load("res://assets/prefab/logroDisabled.tres"))
		var elText = (newPanel.get_child(1) as Label)
		elText.label_settings = elText.label_settings.duplicate();
		listado.add_child(newPanel)
	getLogroPanel(1).visible = true;
	listado.get_child(0).queue_free()
	PlayerProgess.logroUpdate.connect(logroUpdated)
	
func getLogroPanel(num):
	return listado.get_child(num) as Panel;

func logroUpdated(num):
	var elPanel = getLogroPanel(num)
	elPanel.remove_theme_stylebox_override("panel")
	elPanel.add_theme_stylebox_override("panel",load("res://assets/prefab/logroEnabled.tres"))
	(elPanel.get_child(0) as Sprite2D).texture = load("res://assets/img/pcIcons/logroEnabled.png")
	(elPanel.get_child(1) as Label).label_settings.font_color = Color(0.2,0.2,0.2)
	if num == 0:
		for l:Panel in listado.get_children():
			l.visible = true;
			
