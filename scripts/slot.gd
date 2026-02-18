class_name Slot extends Node2D


@export var slot_sprite : AnimatedSprite2D


var is_lit = false:
	get:
		return is_lit
	set(value):
		is_lit = value
		slot_sprite.frame = 1 if is_lit else 0

var angle = 0.0:
	get:
		return angle
	set(value):
		angle = value
		slot_sprite.rotate(angle)
