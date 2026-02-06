class_name NextStateButton
extends Button


func _pressed():
	SignalBus.next_state_button_pressed.emit()
