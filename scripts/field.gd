class_name Field extends Node2D


enum MOON_PHASE {
	NEW_MOON,
	WAXING_CRESCENT,
	FIRST_QUARTER,
	WAXING_GIBBOUS,
	FULL_MOON,
	WANING_GIBBOUS,
	LAST_QUARTER,
	WANING_CRESCENT
}

@export var moon_sprite : MoonSprite
@export var slots : Array[Slot]
@export var radius = 10.0
@export var moon_phase = MOON_PHASE.NEW_MOON:
	get:
		return moon_phase
	set(value):
		moon_phase = value
		moon_sprite.moon_phase = moon_phase
		


func _ready() -> void:
	for i in range(slots.size()):
		var angle = (i + 0.5) * TAU / slots.size()
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		slots[i].position = Vector2(x, y)
		slots[i].angle = angle
