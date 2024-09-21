extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current() # whenever the camera will be ready , this function will make it the current camer
	# in godot we can have multiple cameras, so it is required to set the camera as current cam , whichever we want to render on screen
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0 :
		var player : CharacterBody2D = player_nodes[0]
		# the static typing used here can be done with 'as' , and we can also use node2d here as every other node is a child of this 
		# static typing is done merely for intellisense , but still it is a good practice.
		
		global_position = player.global_position
