extends Control

signal close

func _on_btn_main_menu_pressed() -> void:
	get_tree().paused = false
	close.emit()
