extends CharacterBody2D

@export var speed = 7000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_direction = get_direction_to_player()
	velocity = movement_direction * speed * delta
	move_and_slide()


func get_direction_to_player() -> Vector2 :
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	if player_node != null :
		return (player_node.global_position - global_position).normalized()
	else:
		return Vector2.ZERO


func _on_hitbox_area_entered(_area: Area2D) -> void:
	print("hit by weapon")
	queue_free()
