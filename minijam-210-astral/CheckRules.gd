extends Node

const RuleBAfterA = preload("uid://ckhhavxstsbhj")
const RuleCtoCapart = preload("uid://dmxxr36bud62w")
const RuleNotTripleA = preload("uid://bcpog0lfmbchy")
const RuleDfarfromC = preload("uid://bj67vpsl61ugc")
const RuleFclosetoC = preload("uid://b2uas6ltoq37c")
const Rule3RdNoRepeat = preload("uid://cfcs6nfnknibk")
const Rule9ThNoRepeat = preload("uid://bj0x7inmfx3pq")
const Rule10ThRepeat = preload("uid://g8lm54v0j0m3")
const RuleEmultiple3 = preload("uid://bwrj0iw4ifeci")
const RuleTripleG = preload("uid://ba736gjybk8da")
const Rule13ThRepeat = preload("uid://dpn0msbk8a3h")

signal no_mistakes

@export var spacerNP: NodePath
@onready var spacer: Node2D = get_node(spacerNP)

@onready var audio: AudioStreamPlayer = $"../ASP_sound_error"

var rules:Array[BaseRule] = [
	RuleBAfterA.new(),
	RuleCtoCapart.new(),
	RuleNotTripleA.new(),
	RuleDfarfromC.new(),
	RuleFclosetoC.new(),
	Rule3RdNoRepeat.new(),
	Rule9ThNoRepeat.new(),
	Rule10ThRepeat.new(),
	RuleEmultiple3.new(),
	RuleTripleG.new(),
	Rule13ThRepeat.new()
]

func _ready() -> void:
	print(checkRules())

func checkRules():
	var pieces:Array[Ficha] = spacer.getPiecesArray()
	var error_pieces:Array[Ficha]
	
	for piece in pieces:
		piece.clear_errors()
	
	for rule in rules:
		var listPiecesError = rule.check_rules(pieces)
		error_pieces.append_array(rule.check_rules(pieces))
		if listPiecesError.size() > 0:
			audio.play()
			for error_piece in listPiecesError:
				error_piece.vibrate()
				error_piece.append_error(rule.rule_name)

	return error_pieces.size() == 0

func _on_button_pressed() -> void:
	if checkRules():
		no_mistakes.emit()
