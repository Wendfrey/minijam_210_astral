extends Control

@export var ventanaJuego:Panel;
@export var ventanaLogros:Panel;
@export var ventanaStatus:Panel;
@export var ventanaCredits:Panel;


func _on_juego_close_pressed():
	ventanaJuego.visible = false

func _on_logros_close_pressed():
	ventanaLogros.visible = false

func _on_status_close_pressed():
	ventanaStatus.visible = false
	
func _on_level_1_pressed():
	PlayerProgess.checkDoneLogro(2,0)

func _on_logros_icon_pressed():
	ventanaLogros.visible = true
	
func _on_status_icon_pressed():
	PlayerProgess.checkDoneLogro(1,0)
	PlayerProgess.checkDoneLogro(10,randi_range(0,2))
	ventanaStatus.visible = true
	
func _on_level_manager_level_completed(index: int) -> void:
	ventanaStatus.show()
