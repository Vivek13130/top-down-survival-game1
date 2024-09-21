extends Node2D


signal game_currency_1_collected(number)

func emit_game_curr1_collected(number : int):
	emit_signal("game_currency_1_collected", 1)
