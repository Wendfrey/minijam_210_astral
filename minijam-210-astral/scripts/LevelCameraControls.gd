extends CanvasLayer;


@export var CameraAnimation: AnimationPlayer
@onready var back_button: Button = $"../../../../Guide/SubViewport/Control/CanvasLayer/blackBg/BackButton"
@onready var first_window: CanvasLayer = $"../../../../Guide/SubViewport/Control/CanvasLayer"

func _on_button_pressed():
	CameraAnimation.play("ToWindow")
	await CameraAnimation.animation_finished
	CameraAnimation.play("starwish")
	back_button.disabled = false
	first_window.visible = true
	PlayerProgess.checkDoneLogro(0,0)
	PlayerProgess.checkDoneLogro(9,randi_range(0,2))
	
	
func _on_back_button_pressed():
	back_button.disabled = true
	first_window.visible = true
	CameraAnimation.play_backwards("ToWindow")
	await CameraAnimation.animation_finished
	CameraAnimation.play("idle")
	
func _on_camera_animation_animation_finished(anim_name):
	if anim_name == "starwish":
		PlayerProgess.checkDoneLogro(11,0)
