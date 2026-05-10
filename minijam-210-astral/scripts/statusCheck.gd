extends Panel

@export var indicators:Array[Sprite2D]


func _on_level_manager_level_completed(index):
	var tween = create_tween()
	tween.tween_property(indicators[index], "modulate", Color(0,1,0), 3)
	if PlayerProgess.logros[12].isDone():
		tween = create_tween()
		tween.tween_property(indicators[6], "modulate", Color(0,1,0), 1).set_delay(3)
	
