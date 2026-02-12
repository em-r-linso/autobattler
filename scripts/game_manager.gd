class_name GameManager
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


@export var player_field : Field
@export var initial_state = STATE.TITLE
@export var initial_money = 0
@export var interest_rate = 0.2 # 0.2 == 20% == 1 interest per 5 money
@export var max_interest = 5


var state:
	set(value):
		state = value
		match state:
			STATE.SHOP_ENTER:
				on_state_shop_enter()
			_:
				pass
		SignalBus.game_state_changed.emit(state)
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
	match state:
		STATE.BATTLE_RESULT:
			state = STATE.SHOP_ENTER
		_:
			state += 1
			

func on_state_shop_enter():
	money += min(floor(money * interest_rate), max_interest)
	player_field.moon_phase = (player_field.moon_phase + 1) % Field.MOON_PHASE.size()
