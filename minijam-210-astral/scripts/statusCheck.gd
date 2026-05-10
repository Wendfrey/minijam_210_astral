extends Panel

@export var indicators:Array[Sprite2D]

func _ready():
	PlayerProgess.level_completed.connect(colorTile)

func colorTile(num):
	indicators[num].modulate = Color(0,1,0)
