extends CharacterBody2D

@export var direction = Vector2(0, 0)
const SPEED = 100.0
const DASH_SPEED = 200.0
var move_velocity = Vector2(0, 0)
var moving = false
var is_fishing_start = false
var is_fishing = false
var is_dashing = false
#const JUMP_VELOCITY = -400.0

@onready var animated_sprites = get_node("AnimatedSprite2D")


func _physics_process(delta: float) -> void:
	#$AnimatedSprite2D.play("Idling_down")
	moving = false
	velocity = Vector2.ZERO
	
	#if is_fishing:
		## 釣り中のアニメーションを再生
		#$AnimatedSprite2D.play("Fishing_" + get_fishing_direction())
		#return 

	
	if Input.is_action_pressed("down"):
		velocity.y += SPEED
		direction = Vector2(0, 1)
		$AnimatedSprite2D.play("Walking_down")
		moving = true
	elif Input.is_action_pressed("up"):
		position.y -= 150*delta
		direction = Vector2(0, -1)
		$AnimatedSprite2D.play("Walking_up")
		moving = true
	elif Input.is_action_pressed("left"):
		position.x -= 150*delta
		direction = Vector2(-1, 0)
		$AnimatedSprite2D.play("Walking_left")
		moving = true
	elif Input.is_action_pressed("right"):
		position.x += 150*delta
		direction = Vector2(1, 0)
		$AnimatedSprite2D.play("Walking_right")
		moving = true
	elif Input.is_action_pressed("dash_down"):
		position.y += 600*delta
		direction = Vector2(0, 1)
		$AnimatedSprite2D.play("Dash_down")
		moving = true
	elif Input.is_action_pressed("dash_up"):
		position.y -= 600*delta
		direction = Vector2(0, -1)
		$AnimatedSprite2D.play("Dash_up")
		moving = true
	elif Input.is_action_pressed("dash_right"):
		position.x += 600*delta
		direction = Vector2(1, 0)
		$AnimatedSprite2D.play("Dash_right")
		moving = true
	elif Input.is_action_pressed("dash_left"):
		position.x -= 600*delta
		direction = Vector2(-1, 0)
		$AnimatedSprite2D.play("Dash_left")
		moving = true
		
	#
	#if not moving:
		#if is_fishing:
			##fishing idle
			#if direction.is_equal_approx(Vector2(0, 1)):
				#$AnimatedSprite2D.play("idle_fishing_down")
			#elif direction.is_equal_approx(Vector2(0, -1)):
				#$AnimatedSprite2D.play("idle_fishing_up")
			#elif direction.is_equal_approx(Vector2(-1, 0)):
				#$AnimatedSprite2D.play("idle_fishing_left")
			#elif direction.is_equal_approx(Vector2(1, 0)):
				#$AnimatedSprite2D.play("idle_fishing_right")
		#else:
			#if direction.is_equal_approx(Vector2(0, 1)):
				#$AnimatedSprite2D.play("Idling_down")
			#elif direction.is_equal_approx(Vector2(0, -1)):
				#$AnimatedSprite2D.play("Idling_up")
			#elif direction.is_equal_approx(Vector2(-1, 0)):
				#$AnimatedSprite2D.play("Idling_left")
			#elif direction.is_equal_approx(Vector2(1, 0)):
				#$AnimatedSprite2D.play("Idling_right")


#func start_fishing():
	#is_fishing = false
	if Input.is_action_just_pressed("start_fishing"):
		is_fishing_start = true
		
		if direction.is_equal_approx(Vector2(0, 1)):
			$AnimatedSprite2D.play("Start_fishing_down")
			#is_fishing = true
		elif direction.is_equal_approx(Vector2(0, -1)):
			$AnimatedSprite2D.play("Start_fishing_up")
			#is_fishing = true
		elif direction.is_equal_approx(Vector2(-1, 0)):
			$AnimatedSprite2D.play("Start_fishing_left")
			#is_fishing = true
		elif direction.is_equal_approx(Vector2(1, 0)):
			$AnimatedSprite2D.play("Start_fishing_right")
			#is_fishing = true
		#is_fishing = true
	
	#if Input.is_action_pressed("start_fishing"):
		#direction = Vector2(0, 1)
		#$AnimatedSprite2D.play("Start_fishing_front")
		#is_fishing = true
	#
	#if Input.is_action_pressed("start_fishing_left"):
		#direction = Vector2(-1, 0)
		#$AnimatedSprite2D.play("Start_fishing_left")
		#is_fishing = true
		#
	#if Input.is_action_pressed("start_fishing_right"):
		#direction = Vector2(1, 0)
		#$AnimatedSprite2D.play("Start_fishing_right")
		#is_fishing = true
	if not moving:
		if is_fishing and is_fishing_start:
			#fishing idle
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("idle_fishing_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("idle_fishing_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("idle_fishing_left")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("idle_fishing_right")
		else:
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("Idling_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("Idling_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("Idling_left")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("Idling_right")
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
