class_name Ficha extends CharacterBody2D

enum Tipo {
	A, B, C, D, E, F
}

signal send_picked
signal send_dropped
signal moved

var focused = false
var picked = false
var offset:Vector2

@export var tipo:Tipo = Tipo.A

@onready var sprite_2d: Sprite2D = $Sprite2D

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

func _on_mouse_entered() -> void:
	focused = true

func _on_mouse_exited() -> void:
	focused = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT and event.pressed and focused:
			picked = true
			offset = global_position - get_global_mouse_position()
			top_level = true
			get_viewport().set_input_as_handled()
			send_picked.emit()
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and picked:
			picked = false
			get_viewport().set_input_as_handled()
			send_dropped.emit()
	if event is InputEventMouseMotion and picked:
		global_position = get_global_mouse_position() + offset
		get_viewport().set_input_as_handled()
		moved.emit()
