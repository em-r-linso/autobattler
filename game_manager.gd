extends Node


enum STATE {
	TITLE,
	SHOP_ENTER,
	SHOP_EVENT,
	SHOP_BUY,
	BATTLE_RESOLVE,
	BATTLE_RESULT,
	MATCH_RESULT
}

const state_names = {
	null: "null",
	STATE.TITLE: "title",
	STATE.SHOP_ENTER: "shop enter",
	STATE.SHOP_EVENT: "shop event",
	STATE.SHOP_BUY: "shop buy",
	STATE.BATTLE_RESOLVE: "battle resolve",
	STATE.BATTLE_RESULT: "battle result",
	STATE.MATCH_RESULT: "match result"
}


@export var initial_state = STATE.TITLE
@export var initial_money = 0


var state:
	set(value):
		state = value
		SignalBus.game_state_changed.emit(state, state_names[state])
	get:
		return state

var money:
	set(value):
		money = value
		SignalBus.money_changed.emit(money)
	get:
		return money


func _enter_tree():
	SignalBus.next_state_button_pressed.connect(on_next_state_button_pressed)


func _exit_tree():
	SignalBus.next_state_button_pressed.disconnect(on_next_state_button_pressed)


func _ready():
	state = initial_state
	money = initial_money
	
	
func on_next_state_button_pressed():
	state += 1
