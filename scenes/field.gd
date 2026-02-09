extends Node2D


@export var items : Array[Node2D]
@export var radius = 10.0


func _ready() -> void:
	for i in range(items.size()):
		var x = cos((i + 0.5) * TAU / items.size()) * radius
		var y = sin((i + 0.5) * TAU / items.size()) * radius
		items[i].position = Vector2(x, y)
