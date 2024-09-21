extends Node

@export var sword_ability : PackedScene

var max_attack_range = 150

func _ready() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	
	enemies = enemies.filter(
		func(enemy : Node2D): 
			return enemy.global_position.distance_to(player.global_position) <= max_attack_range
	)
	
	if enemies.size() == 0: return
	
	enemies.sort_custom(func(a : Node2D , b : Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance <= b_distance
	)
	
	
	var new_sword = sword_ability.instantiate() as Node2D
	
#	setting position and flip of the sword 
	new_sword.global_position = enemies[0].global_position
	if player.global_position.x < new_sword.global_position.x :
		new_sword.scale.x = -1
	
	player.get_parent().add_child(new_sword)
