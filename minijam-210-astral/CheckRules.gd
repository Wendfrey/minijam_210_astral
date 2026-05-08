extends Node2D

const RuleBAfterA = preload("uid://ckhhavxstsbhj")

@onready var spacer: Node2D = $Spacer
@onready var label: Label = $CanvasLayer/Label
var rules:Array[BaseRules] = [
	RuleBAfterA.new()
]

var text:String :
	set(value):
		label.text = value

func _ready() -> void:
	print(checkRules())

func checkRules():
	var pieces:Array[Ficha] = spacer.getPiecesArray()
	
	for rule in rules:
		if not rule.check_rules(pieces):
			text = "No OK"
			return false
		
	text = "Todo OK"
	return true

func _on_button_pressed() -> void:
	print(checkRules())
