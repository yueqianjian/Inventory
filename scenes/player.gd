extends CharacterBody2D

var currentSpeed = 300.0


func _physics_process(delta):
	move()



func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = direction * currentSpeed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
