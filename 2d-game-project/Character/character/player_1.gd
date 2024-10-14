extends CharacterBody2D

@export var move_speed : float = 100

func _physics_process(_delta):
	
	var input_direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"),
		
	)
	
	#print(input_direction)
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	#move_and_collide()
	
