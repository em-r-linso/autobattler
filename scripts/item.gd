extends Node2D


@export var debug_random_items : Array[ItemData] # TODO: remove
@export var sprite : Sprite2D


var data : ItemData
var behaviors : Array[ItemBehavior] = []


func _ready():
	setup(debug_random_items[randi_range(0, debug_random_items.size() - 1)]) # TODO: remove
	on_tick() # TODO: remove


func setup(item_data : ItemData):
	data = item_data
	for behavior in data.behaviors:
		behaviors.append(behavior.duplicate())
	sprite.texture = data.sprite


func on_tick():
	for behavior in behaviors:
		behavior.on_tick()
