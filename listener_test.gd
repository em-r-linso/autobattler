extends Node


func _enter_tree():
	SignalBus.game_state_changed.connect(on_game_state_changed)
	

func _exit_tree():
	SignalBus.game_state_changed.disconnect(on_game_state_changed)
	
	
func on_game_state_changed(state : int):
	print(state)
