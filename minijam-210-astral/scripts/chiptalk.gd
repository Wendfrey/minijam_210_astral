extends Label

@export var textLines: Array[String]
@export var chiptalkAnim: AnimationPlayer
@export var sceneTransition: AnimationPlayer

var lineCount = 0;

func _on_chiptalk_anim_animation_finished(anim_name):
	if lineCount < textLines.size():
		self.text = textLines[lineCount];
		lineCount +=1;
		chiptalkAnim.play(anim_name)
	else:
		endScene();

func _on_skip_button_pressed():
	endScene();

func endScene():
	chiptalkAnim.stop()
	sceneTransition.play("out");
	

func _on_scene_transition_animation_finished(anim_name):
	if anim_name == "start":
		chiptalkAnim.play("chiptalkFade");
	elif anim_name == "out":
		get_tree().change_scene_to_file("res://Scenes/Nivel.tscn")
