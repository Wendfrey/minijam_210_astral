extends Control

@onready var options_screen: Control = $OptionsScreen
@onready var v_box_container: VBoxContainer = $VBoxContainer

func _on_btn_exit_pressed() -> void:
	get_tree().quit()


func _on_btn_options_pressed() -> void:
	options_screen.show()
	v_box_container.hide()

func _on_options_screen_close() -> void:
	options_screen.hide()
	v_box_container.show()
