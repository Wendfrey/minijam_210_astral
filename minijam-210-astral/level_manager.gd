extends Node

signal spacer_changed(spacer:Control)
signal level_completed(index:int)

@onready var spacer_container: Control = $"../JuegoVentana/SpacerContainer"
@onready var juego_ventana: Panel = $"../JuegoVentana"


const Spacer = preload("uid://c8jcc5y7w1h2k")

const Level1 = preload("uid://cowrxku5le6ed")
const Level2 = preload("uid://cliskxier8edx")
const Level3 = preload("uid://binbx6vgi8hn3")
const Level4 = preload("uid://doguigma4krv0")
const Level5 = preload("uid://du5ubj4deinig")
const Level6 = preload("uid://by2om62gsy1or")

@onready var levels_array:Array[BaseLevel] = [
	Level1.new(),
	Level2.new(),
	Level3.new(),
	Level4.new(),
	Level5.new(),
	Level6.new()
]

var currentLevel:int = 0


func _ready() -> void:
	for lvl in levels_array:
		var spacer = Spacer.new()
		spacer_container.add_child(spacer)
		spacer.hide()
		lvl.spacer = spacer
		lvl.next_level()
	
func arrayFichaTipo(array:Array):
	return Array(
		array,
		TYPE_INT,
		"",
		Ficha.Tipo
	)

func _on_rules_checker_result(result:bool) -> void:
	if result:
		levels_array[currentLevel].next_level()
		if levels_array[currentLevel].is_complete():
			level_completed.emit(currentLevel)
			juego_ventana.hide()
	
func empty_spacer():
	spacer_container.get_child(currentLevel).remove_pieces(
		arrayFichaTipo(
			spacer_container.get_child(currentLevel).pieces.map(func (el): return el.tipo)
		)
	)

func on_level_pressed(index:int):
	if index < levels_array.size():
		if levels_array[index].is_complete():
			return
		currentLevel = index
		juego_ventana.show()
		for c in spacer_container.get_children():
			c.hide()
		var spacer = spacer_container.get_child(index)
		spacer.show()
		spacer_changed.emit(spacer)
