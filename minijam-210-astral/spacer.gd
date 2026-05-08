extends Node2D

@export var pieces:Array[NodePath]

var array_positions:Array[Vector2]
var pickedNode: Node2D
var nodePositionIndex:int

func _ready() -> void:
	var half = roundi(pieces.size() / 2)
	for i in range(pieces.size()):
		array_positions.append(Vector2((i - half)*128, 0))
		var node = get_node(pieces[i])
		node.global_position = array_positions[i]
		node.send_picked.connect(_piece_picked.bind(node))
		node.send_dropped.connect(_piece_dropped.bind(node))

func _piece_picked(node:Node2D):
	if dropped_tween.get("node", null) == node:
		dropped_tween["tween"].kill()
	node.moved.connect(_on_element_item_rect_changed)
	nodePositionIndex = pieces.find(get_path_to(node))
	pickedNode = node
	
var dropped_tween:Dictionary = {}
func _piece_dropped(node:Node2D):
	node.moved.disconnect(_on_element_item_rect_changed)
	var tween:Tween = create_tween()
	tween.tween_property(node, "global_position", array_positions[nodePositionIndex], calculate_time(node.global_position, array_positions[nodePositionIndex]))\
	.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(node, "top_level", false, 0)
	tween.finished.connect(func (): if dropped_tween["node"] == node: dropped_tween = {})
	pickedNode = null
	dropped_tween["tween"] = tween
	dropped_tween["node"] = node
	
var previousTweens:Dictionary = {}
func _on_element_item_rect_changed():
	var closest_index = -1
	for i in range(array_positions.size()):
		if abs(array_positions[i].x - pickedNode.global_position.x) < 64:
			closest_index = i
			break
	
	if closest_index == -1 or closest_index == nodePositionIndex:
		return
	var start = closest_index if closest_index < nodePositionIndex else nodePositionIndex
	var finish = nodePositionIndex if closest_index < nodePositionIndex else closest_index
	pieces.remove_at(nodePositionIndex)
	pieces.insert(closest_index, get_path_to(pickedNode))
	for i in range(start, finish+1):
		var nPath = pieces[i]
		var node = get_node(nPath)
		if node == pickedNode:
			continue
		if previousTweens.has(nPath):
			previousTweens[nPath].kill()
			previousTweens.erase(nPath)
		var tween:Tween = create_tween()
		tween.tween_property(node,"global_position", array_positions[i], calculate_time(array_positions[i], node.global_position))\
		.set_trans(Tween.TRANS_CUBIC)
		tween.finished.connect(func (): previousTweens.erase(nPath))
		previousTweens[nPath] = tween
		
	nodePositionIndex = closest_index
	
func calculate_time(position1, position2) -> float:
	return position1.distance_to(position2) / 384.0

func getPiecesArray() -> Array[Ficha]:
	#return pieces.map(func(element): return get_node(element))
	return Array(
		pieces.map(func(element): return get_node(element)),
		TYPE_OBJECT,
		"CharacterBody2D",
		Ficha
	)
