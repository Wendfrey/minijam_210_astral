extends CanvasLayer;


@export var CameraAnimation: AnimationPlayer


func _on_button_pressed():
	CameraAnimation.play("ToWindow")
	pass # Replace with function body.
