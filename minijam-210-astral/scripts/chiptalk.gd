extends Label

@export var textLines: Array[String]
@export var chiptalkAnim: AnimationPlayer

var lineCount = 0;

func _on_chiptalk_anim_animation_finished(anim_name):
	if lineCount < textLines.size():
		self.text = textLines[lineCount];
		lineCount +=1;
		chiptalkAnim.play(anim_name)
	else:
		nextScene();

func _on_skip_button_pressed():
	nextScene();

func nextScene():
	get_tree().change_scene_to_file("res://Scenes/Nivel.tscn")
