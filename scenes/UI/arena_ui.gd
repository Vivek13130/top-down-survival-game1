extends CanvasLayer

@export var arena_time_manager_node : Node
@onready var label: Label = %Label



func _process(delta: float) -> void:
	if arena_time_manager_node == null:
		return
	
	var time_elapsed = arena_time_manager_node.get_elapsed_time()
	label.text = format_time_in_seconds(time_elapsed)


# very good time formatting 
func format_time_in_seconds(time : float) -> String :
	var min = floor(time / 60)
	var rem_sec = time - (min * 60)
	return str(min) + " : " + ("%02d" % floor(rem_sec))
