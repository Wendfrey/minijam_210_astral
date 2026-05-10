extends CanvasLayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = !visible
		get_tree().paused = !get_tree().paused
		print(get_tree().paused)

func _on_btn_main_menu_pressed() -> void:
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
