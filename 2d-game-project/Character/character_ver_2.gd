extends CharacterBody2D


const SPEED = 100.0
#const JUMP_VELOCITY = -400.0

@onready var animated_sprites = get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("idling_right")
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#$AnimatedSprite2D.play("Walking_right")
		#velocity.x = direction * SPEED
		##print(direction)
		#if direction == -1:
			#$AnimatedSprite2D.flip_h = true
		#else: 
			#$AnimatedSprite2D.flip_h = false
			#
	##var direction :=Input.get_axis("down","up")
	#if direction:
		#$AnimatedSprite2D.play("Walking_down")
		#velocity.x = direction * SPEED
		#
		#if direction == -1:
			#$AnimatedSprite2D.play("Walking_down")
		#else:
			#$AnimatedSprite2D.play("Walking_up")
			#
			
	if Input.is_action_pressed("down"):
		velocity.y += 500*delta
		$AnimatedSprite2D.play("Walking_down")
	if Input.is_action_pressed("up"):
		position.y -= 500*delta
	if Input.is_action_pressed("left"):
		position.x -= 500*delta
	if Input.is_action_pressed("right"):
		position.x += 500*delta
		
		
	
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
