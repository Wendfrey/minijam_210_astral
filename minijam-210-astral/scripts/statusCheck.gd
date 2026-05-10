extends Panel

@export var indicators:Array[Sprite2D]


func _on_level_manager_level_completed(index):
	indicators[index].modulate = Color(0,1,0)
