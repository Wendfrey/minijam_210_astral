extends CanvasLayer;


@export var CameraAnimation: AnimationPlayer
@onready var back_button: Button = $"../../../../Guide/SubViewport/Control/CanvasLayer/blackBg/BackButton"
@onready var first_window: CanvasLayer = $"../../../../Guide/SubViewport/Control/CanvasLayer"

func _on_button_pressed():
	CameraAnimation.play("ToWindow")
	await CameraAnimation.animation_finished
	back_button.disabled = false
	first_window.visible = true
	
	
func _on_back_button_pressed():
	back_button.disabled = true
	first_window.visible = true
	CameraAnimation.play_backwards("ToWindow")
	await CameraAnimation.animation_finished
	CameraAnimation.play("idle")
