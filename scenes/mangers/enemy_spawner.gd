extends Node

@export var basic_enemy : PackedScene 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	
#	always play safe when you are getting something like the player , from memory or somewhere else 
# there may be scenarios when player is removed , so further code might be game breaking , if you don't handle it carefully
	if player == null:
		return 
	
	var random_dir = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	var spawn_pos = random_dir * min(get_viewport().size.x, get_viewport().size.y)
	var enemy_instance = basic_enemy.instantiate() as Node2D
	enemy_instance.global_position = spawn_pos + player.global_position
	
	player.get_parent().add_child(enemy_instance)
	print("spawned")
