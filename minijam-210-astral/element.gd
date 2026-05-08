extends CharacterBody2D

signal send_picked
signal send_dropped
signal moved

var focused = false
var picked = false
var offset:Vector2


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
