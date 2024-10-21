extends CharacterBody2D


const SPEED = 0.10
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
	else:
		velocity.x = 0 
		velocity.y = 0

	move_and_slide()
	
	
