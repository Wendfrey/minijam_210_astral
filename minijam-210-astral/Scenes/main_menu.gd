extends Control

@onready var options_screen: Control = $OptionsScreen
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var sceneTransition: AnimationPlayer = $SceneTransition
@onready var option_button: Button = $VBoxContainer/BTN_Options
@onready var play_button: Button = $VBoxContainer/BTN_Play
@onready var exit_button: Button = $VBoxContainer/BTN_Exit



func _on_btn_exit_pressed() -> void:
	get_tree().quit()

func _on_btn_options_pressed() -> void:
	options_screen.show()
	v_box_container.hide()

func _on_options_screen_close() -> void:
	options_screen.hide()
	v_box_container.show()

func _on_btn_play_pressed() -> void:
	play_button.disabled = true
	option_button.disabled = true
	exit_button.disabled = true
	sceneTransition.play("out")

func _on_scene_transition_animation_finished(anim_name):
	if anim_name == "out":
		get_tree().change_scene_to_file("res://Scenes/SkipLore.tscn")
