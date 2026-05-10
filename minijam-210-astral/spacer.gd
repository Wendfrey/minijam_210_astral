extends Node2D

const ELEMENT = preload("uid://cte0ymnxkobwq")
const SecretLovers = preload("uid://w7gf6cgu38n2")

var pieces:Array[Ficha]

var array_positions:Array[Vector2]
var pickedNode: Node2D
var nodePositionIndex:int

@export var swapMargin:Vector2 = Vector2(64,172)
@export var cellWidth: int = 128

var secretLovers:BaseRule = SecretLovers.new()

func _ready() -> void:
	pieces = Array(
		get_children().duplicate(),
		TYPE_OBJECT,
		"CharacterBody2D",
		Ficha
	)
	var center = (pieces.size() - 1) * cellWidth / 2.0
	for i in range(pieces.size()):
		array_positions.append(Vector2((i * cellWidth - center), 0))
		var node = pieces[i]
		node.global_position = array_positions[i]
		node.send_picked.connect(_piece_picked.bind(node))
		node.send_dropped.connect(_piece_dropped.bind(node))

func _piece_picked(node:Node2D):
	for i in get_children():
		i.showTooltip = false
	if dropped_tween.get("node", null) == node:
		dropped_tween["tween"].kill()
	node.moved.connect(_on_element_item_rect_changed)
	nodePositionIndex = pieces.find(node)
	pickedNode = node
	
var dropped_tween:Dictionary = {}
func _piece_dropped(node:Node2D):
	for i in get_children():
		i.showTooltip = true
	node.moved.disconnect(_on_element_item_rect_changed)
	var tween:Tween = create_tween()
	tween.tween_property(node, "global_position", array_positions[nodePositionIndex], calculate_time(node.global_position, array_positions[nodePositionIndex]))\
	.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(node, "top_level", false, 0)
	tween.finished.connect(func (): if dropped_tween["node"] == node: dropped_tween = {})
	pickedNode = null
	dropped_tween["tween"] = tween
	dropped_tween["node"] = node
	
	secretLovers.check_rules(pieces.duplicate())

var previousTweens:Dictionary = {}
func _on_element_item_rect_changed():
	var closest_index = -1
	for i in range(array_positions.size()):
		if abs(array_positions[i].x - pickedNode.global_position.x) < swapMargin.x and abs(array_positions[i].y - pickedNode.global_position.y) < swapMargin.y:
			closest_index = i
			break
	
	if closest_index == -1 or closest_index == nodePositionIndex or pieces[closest_index].nailed:
		return
	var start = closest_index if closest_index < nodePositionIndex else nodePositionIndex
	var finish = nodePositionIndex if closest_index < nodePositionIndex else closest_index
	
	var nailedEl = pieces.filter(func (el:Ficha): return el.nailed)
	var nailedIndexList = nailedEl.map(func(el:Ficha): return pieces.find(el))
	
	pieces.erase(pickedNode)
	pieces.insert(closest_index, pickedNode)
	for i in range(nailedEl.size()):
		if closest_index > nailedIndexList[i] and nailedIndexList[i] < nodePositionIndex:
			continue
		pieces.erase(nailedEl[i])
		pieces.insert(nailedIndexList[i], nailedEl[i])
	
	for i in range(start, finish+1):
		var node = pieces[i]
		var nPath = get_path_to(node)
		if node == pickedNode:
			continue
		else:
			node.sound_move()
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
	return min(position1.distance_to(position2) / 1500.0, 0.3) + 0.2

func getPiecesArray() -> Array[Ficha]:
	#return pieces.map(func(element): return get_node(element))
	return pieces.duplicate()

func add_pieces(tipoArray:Array[Ficha.Tipo], withAnimation=true):
	for i in range(tipoArray.size()):
		var tipo = tipoArray[i]
		var nficha:Ficha = ELEMENT.instantiate()
		nficha.global_position = Vector2(600 + cellWidth * i, 0)
		nficha.send_picked.connect(_piece_picked.bind(nficha))
		nficha.send_dropped.connect(_piece_dropped.bind(nficha))
		nficha.tipo = tipo
		
		pieces.append(nficha)
		add_child(nficha)
		
	reset_values(withAnimation, tipoArray.size())
	secretLovers.check_rules(pieces.duplicate())

func add_piece(tipo: Ficha.Tipo, withAnimation=true):
	var nficha:Ficha = ELEMENT.instantiate()
	nficha.global_position = Vector2(600, 0)
	nficha.send_picked.connect(_piece_picked.bind(nficha))
	nficha.send_dropped.connect(_piece_dropped.bind(nficha))
	nficha.tipo = tipo
	
	pieces.append(nficha)
	add_child(nficha)
	
	reset_values.call_deferred(withAnimation)
	secretLovers.check_rules(pieces.duplicate())
		
func reset_values(withAnimation=true, inserted = 1):
	var center = (pieces.size() - 1) * cellWidth / 2.0
	array_positions.clear()
	for i in range(pieces.size()):
		array_positions.append(Vector2((i * cellWidth - center), 0))
		var node = pieces[i]
		if not withAnimation:
			node.global_position = array_positions[i]
	
	if withAnimation:
		createInsertAnimation(inserted)
	
func createInsertAnimation(inserted):
	for child_i in range(pieces.size()):
		var child = pieces[child_i]
		var nPosition = array_positions[child_i]
		var tween = child.create_tween()
		var time = calculate_time(child.position, nPosition)
		if child_i >= pieces.size()-inserted:
			time /= 4
		tween.tween_property(child, "global_position", nPosition, time)\
		.set_trans(Tween.TRANS_CUBIC)

func remove_pieces(arrayTipo:Array[Ficha.Tipo]):
	
	var nailedEl = pieces.filter(func (el:Ficha): return el.nailed)
	var nailedIndexList = nailedEl.map(func(el:Ficha): return pieces.find(el))
	
	var nodesToRemove:Array[Ficha] = []
	for tipo in arrayTipo:
		var result = pieces.find_custom(func (piece:Ficha): return piece.tipo == tipo)
		if result > -1:
			nodesToRemove.append(pieces.pop_at(result))
	
	for i in range(nailedEl.size()):
		pieces.erase(nailedEl[i])
		pieces.insert(nailedIndexList[i], nailedEl[i])
		
	var tweenBig = create_tween()
	for node in nodesToRemove:
		var tween = create_tween()
		tween.tween_property(node, "global_position", Vector2(0, -500), 0.6).as_relative().set_trans(Tween.TRANS_CUBIC)
		tween.finished.connect(node.queue_free)
		tweenBig.parallel().tween_subtween(tween)
	tweenBig.parallel().tween_callback(reset_values.bind(true, 0)).set_delay(0.2)
	
	secretLovers.check_rules(pieces.duplicate())

func remove_entity_piece(piece):
	var nailedEl = pieces.filter(func (el:Ficha): return el.nailed)
	var nailedIndexList = nailedEl.map(func(el:Ficha): return pieces.find(el))
	
	var indexRemove = pieces.find(piece)
		
	for i in get_children():
		i.showTooltip = true
	pieces.erase(piece)
	piece.queue_free()
	
	for i in range(nailedEl.size()):
		if indexRemove > nailedIndexList[i]:
			continue
		pieces.erase(nailedEl[i])
		
		pieces.insert(min(nailedIndexList[i], pieces.size()), nailedEl[i])
	
	reset_values(true, 0)
