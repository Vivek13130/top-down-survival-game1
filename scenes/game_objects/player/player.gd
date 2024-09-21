extends CharacterBody2D

@export var max_speed = 10000
@export var acc_smoothing = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_direction = get_movement_direction().normalized()
	var target_velocity = movement_direction * max_speed * delta
	velocity += (target_velocity - velocity).normalized() * acc_smoothing
	if velocity.length() >= max_speed :
		velocity = velocity.normalized() * max_speed
	move_and_slide()


func get_movement_direction()->Vector2 :
	var dir = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		dir += Vector2(0 , 1)
	if Input.is_action_pressed("move_up"):
		dir += Vector2(0 , -1)
	if Input.is_action_pressed("move_left"):
		dir += Vector2(-1 , 0)
	if Input.is_action_pressed("move_right"):
		dir += Vector2(1 , 0)
	return dir
