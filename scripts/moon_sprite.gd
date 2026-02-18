class_name MoonSprite extends AnimatedSprite2D


var moon_phase = Field.MOON_PHASE.NEW_MOON:
	get:
		return moon_phase
	set(value):
		moon_phase = value
		frame = moon_phase
