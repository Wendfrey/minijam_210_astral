class_name Ficha extends CharacterBody2D

enum Tipo {
	A, B, C, D, E, F, G
}

signal send_picked
signal send_dropped
signal moved

const tooltip_hor_margin = 480

var focused = false
var picked = false
var nailed = false:
	set(value):
		nailed = value
		z_index = -1 if nailed else 0
		set_modulation() 
var showTooltip = true:
	set(value):
		showTooltip = value
		if showTooltip:
			if focused:
				show_tooltip()
		else:
			center_container.hide()
var offset:Vector2
var current_anim:Tween = null
var current_pos:Vector2

@export var tipo:Tipo = Tipo.A
var anulled:bool = false:
	set(value):
		anulled = value
		set_modulation()
var errores:Array[String]

@onready var audioplayer = $ASP_sounds
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var v_box_container: VBoxContainer = $PanelContainer/VBoxContainer
@onready var center_container: PanelContainer = $PanelContainer

func _ready() -> void:
	match(tipo):
		Tipo.A:
			sprite_2d.texture = preload("uid://cki01o01cheno")
		Tipo.B:
			sprite_2d.texture = preload("uid://c0r0xyy7ehgk")
		Tipo.C:
			sprite_2d.texture = preload("uid://blmklmcnksp0q")
		Tipo.D:
			sprite_2d.texture = preload("uid://b32eqjyx8hpm7")
		Tipo.E:
			sprite_2d.texture = preload("uid://cottcd1yxvw7y")
		Tipo.F:
			sprite_2d.texture = preload("uid://doe08bn356iws")
		Tipo.G:
			sprite_2d.texture = preload("uid://bmdm4l8lcbfl4")

func _on_mouse_entered() -> void:
	if showTooltip:
		show_tooltip()
	focused = true
		
func _on_mouse_exited() -> void:
	center_container.hide()
	focused = false

func _unhandled_input(event: InputEvent) -> void:
	var audio
	if event is InputEventMouseButton:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and event.pressed and focused and not nailed:
			picked = true
			offset = global_position - get_global_mouse_position()
			top_level = true
			get_viewport().set_input_as_handled()
			audio = ResourceLoader.load("res://Sounds/stone_picked.wav")
			audioplayer.stream = audio
			if not audioplayer.playing:
				audioplayer.play()
			send_picked.emit()
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and picked:
			picked = false
			get_viewport().set_input_as_handled()
			audio = ResourceLoader.load("res://Sounds/stone_drop.wav")
			audioplayer.stream = audio
			if not audioplayer.playing:
				audioplayer.play()
			send_dropped.emit()
		if OS.is_debug_build() and event.button_index == MouseButton.MOUSE_BUTTON_RIGHT and event.double_click and focused:
			nailed = not nailed
	if event is InputEventMouseMotion and picked:
		global_position = get_global_mouse_position() + offset
		get_viewport().set_input_as_handled()
		moved.emit()

func vibrate():
	if current_anim:
		current_anim.stop()
	current_pos = position
	current_anim = get_tree().create_tween()
	current_anim.bind_node(self)
	current_anim.tween_property(self, "position", Vector2(2, 0), 0.05).as_relative()
	current_anim.tween_property(self, "position", Vector2(-4, 2), 0.05).as_relative()
	current_anim.tween_property(self, "position", Vector2(2, -4), 0.05).as_relative()
	current_anim.tween_property(self, "position", Vector2(-2, 2), 0.05).as_relative()
	current_anim.tween_property(self, "position", current_pos, 0.05)

func clear_errors():
	errores.clear()
	set_modulation()
	for i in v_box_container.get_children():
		v_box_container.remove_child(i)
	
func append_error(error):
	errores.append(error)
	var newChild = RichTextLabel.new()
	newChild.bbcode_enabled = true
	newChild.theme = preload("uid://c5w85c14jb564")
	newChild.text = error
	newChild.size_flags_horizontal = Control.SIZE_FILL
	newChild.size_flags_vertical = Control.SIZE_EXPAND_FILL
	newChild.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	newChild.autowrap_mode = TextServer.AUTOWRAP_OFF
	newChild.fit_content = true
	v_box_container.add_child(
		newChild
	)
	set_modulation()
	

func show_tooltip():
	if not errores.is_empty():
		center_container.position.x = -center_container.size.x / 2
		center_container.global_position.x = clamp(center_container.global_position.x, -tooltip_hor_margin, tooltip_hor_margin - center_container.size.x)
		center_container.position.y = -82 - center_container.size.y
		center_container.show()
		
func sound_move():
	var audio
	audio = ResourceLoader.load("res://Sounds/stone_dragged.wav")
	audioplayer.stream = audio
	if !audioplayer.playing:
		audioplayer.play()
		
func set_modulation():
	var color = Color.GRAY if nailed else Color.WHITE
	if not errores.is_empty():
		if nailed:
			color = Color.DIM_GRAY
		else:
			color = color.lerp(Color.RED, 0.3)
	elif anulled:
		color = color.lerp(Color.BLUE, 0.5)
	sprite_2d.modulate = color
