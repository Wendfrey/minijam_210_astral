extends CanvasLayer;


@export var CameraAnimation: AnimationPlayer


func _on_button_pressed():
	CameraAnimation.play("ToWindow")
	pass # Replace with function body.


func _on_back_button_pressed():
	CameraAnimation.play_backwards("ToWindow")
	await CameraAnimation.animation_finished
	CameraAnimation.play("idle")
	pass # Replace with function body.
