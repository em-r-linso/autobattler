class_name Slot extends Node2D


@export var slot_sprite : Sprite2D


var angle = 0.0:
	get:
		return angle
	set(value):
		angle = value
		print(angle)
		slot_sprite.rotate(angle)
