class_name MoneyLabel
extends Label


func _enter_tree():
	SignalBus.money_changed.connect(on_money_changed)


func _exit_tree():
	SignalBus.money_changed.disconnect(on_money_changed)
	
	
func on_money_changed(money : int):
	text = str(money)
