extends Control

@onready var spacer = $TestWorld/Spacer

func _ready() -> void:
	$TestWorld/LevelManager.queue_free()

func _create_item(tipo):
	if $CanvasLayer/HBoxContainer/BorrarButton.button_pressed:
		spacer.remove_pieces(
			Array(
				[tipo as Ficha.Tipo],
				TYPE_INT,
				"",
				Ficha.Tipo
			)
		)
	else:
		spacer.add_piece(tipo)
