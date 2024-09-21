extends Node2D

var currency_1_count :int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_currency_1_collected.connect(on_game_currency_1_collected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_game_currency_1_collected(number : int):
	currency_1_count += 1
	print(currency_1_count)
