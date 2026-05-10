extends Control

@export var ventanaJuego:Panel;
@export var ventanaLogros:Panel;
@export var ventanaStatus:Panel;
@export var ventanaCredits:Panel;


func _on_juego_close_pressed():
	ventanaJuego.visible = false

func _on_logros_close_pressed():
	ventanaLogros.visible = false

func _on_level_1_pressed():
	PlayerProgess.checkDoneLogro(2,0)
	ventanaJuego.visible = true

func _on_logros_icon_pressed():
	ventanaLogros.visible = true
