extends Node2D


@export var slots : Array[Slot]
@export var radius = 10.0


func _ready() -> void:
	for i in range(slots.size()):
		var angle = (i + 0.5) * TAU / slots.size()
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		slots[i].position = Vector2(x, y)
		slots[i].angle = angle
