extends Control

@onready var spacer = $TestWorld/JuegoVentana/Spacer

func _ready() -> void:
	$TestWorld/LevelManager.queue_free()
	$TestWorld/RulesChecker.rule_check_result.connect(func (result): print(result))

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	spacer.remove_entity_piece(body)
