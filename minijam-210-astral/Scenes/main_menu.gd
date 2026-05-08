extends Control


func _on_btn_exit_pressed() -> void:
	get_tree().quit()


func _on_btn_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/OptionsScreen.tscn")
