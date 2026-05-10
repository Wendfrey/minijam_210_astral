extends Control

@export var ventanaJuego:Panel;
@export var ventanaLogros:Panel;
@export var ventanaStatus:Panel;
@export var ventanaCredits:Panel;
@onready var win_con_panel: Panel = $WinConPanel
@onready var grid_container: GridContainer = $GridContainer


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
	PlayerProgess.checkDoneLogro(4, 0)
	grid_container.get_child(index).modulate = Color.GREEN
	ventanaStatus.show()
	PlayerProgess.checkDoneLogro(12, index)
	if PlayerProgess.is_logro_completed(12):
		show_winner()

func _on_wincon_button_pressed() -> void:
	win_con_panel.hide()
	
var only_once = false
func show_winner():
	if only_once:
		return
	only_once = true
	await get_tree().create_timer(4).timeout
	win_con_panel.show()
