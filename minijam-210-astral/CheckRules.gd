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
	var error_pieces:Array[Ficha]
	
	for piece in pieces:
		piece.errores.clear()
	
	for rule in rules:
		error_pieces.append_array(rule.check_rules(pieces))
		if error_pieces.size() > 0:
			for error_piece in error_pieces:
				error_piece.vibrate()
				error_piece.errores.append(rule.rule_name)

	return error_pieces.size() == 0

func _on_button_pressed() -> void:
	print(checkRules())
