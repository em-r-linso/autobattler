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

const slots_lit_per_moon_phase = {
	MOON_PHASE.NEW_MOON: [],
	MOON_PHASE.WAXING_CRESCENT: [0, 7],
	MOON_PHASE.FIRST_QUARTER: [0, 1, 6, 7],
	MOON_PHASE.WAXING_GIBBOUS: [0, 1, 2, 5, 6, 7],
	MOON_PHASE.FULL_MOON: [0, 1, 2, 3, 4, 5, 6, 7],
	MOON_PHASE.WANING_GIBBOUS: [1, 2, 3, 4, 5, 6],
	MOON_PHASE.LAST_QUARTER: [2, 3, 4, 5],
	MOON_PHASE.WANING_CRESCENT: [3, 4],
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
		update_slot_lighting()


func _ready() -> void:
	for i in range(slots.size()):
		var angle = (i + 0.5) * TAU / slots.size()
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		slots[i].position = Vector2(x, y)
		slots[i].angle = angle


func update_slot_lighting():
	for slot_index in range(slots.size()):
		slots[slot_index].is_lit = slots_lit_per_moon_phase[moon_phase].has(slot_index)
