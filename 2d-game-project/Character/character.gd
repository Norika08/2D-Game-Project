extends CharacterBody2D

@export var direction = Vector2(0, 0)
const SPEED = 100.0
const DASH_SPEED = 200.0
var move_velocity = Vector2(0, 0)
var moving = false
var wood_counter = 0
var fish_counter = 0
@onready var weapon = $weapon


#var is_start_fishing = false
var fishing = false
var is_fishing = false
var is_fishing_idling = false
var is_finish_fishing = false
var is_dashing = false
var is_chopping = false
var is_digging = false
var is_fishing_success = false

#const JUMP_VELOCITY = -400.0
#const WOOD = preload("res://wood.tscn")
const WOOD = preload("res://wood2.tscn")
const FISH = preload("res://fish.tscn")
@onready var animated_sprites = get_node("AnimatedSprite2D")
@onready var wood_sound = $"../wood_sound"
@onready var fishing_sound = $"../Fishing_start"
@onready var catch_sound = $"../catch_fish"
@onready var walking_sound =$"../walking"
#@onready var fishing_timer = get_node("$fishing Timer")  



func _physics_process(delta: float) -> void:
	#$AnimatedSprite2D.play("Idling_down")
	moving = false
	#fishing = false
	velocity = Vector2.ZERO
	


	
	#if is_fishing:
		## 釣り中のアニメーションを再生
		#$AnimatedSprite2D.play("Fishing_" + get_fishing_direction())
		#return 

	if not is_fishing_idling or not is_fishing or not is_finish_fishing or not moving:
		walking_sound.play()
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
	#if Input.is_action_just_pressed("start_fishing"):
		##is_fishing_start = true
		#state = "fishing"
		#
	#match state :
		#"start_fishing":
			#if direction.is_equal_approx(Vector2(0, 1)):
				#$AnimatedSprite2D.play("Start_fishing_down")
			##is_fishing = true
			#elif direction.is_equal_approx(Vector2(0, -1)):
				#$AnimatedSprite2D.play("Start_fishing_up")
			##is_fishing = true
			#elif direction.is_equal_approx(Vector2(-1, 0)):
				#$AnimatedSprite2D.play("Start_fishing_left")
			##is_fishing = true
			#elif direction.is_equal_approx(Vector2(1, 0)):
				#$AnimatedSprite2D.play("Start_fishing_right")
		#"walking":
			#
	#else state = id
		
		#is_fishing = false
#func start_fishing() -> void:
	#moving = true


		
		
	if Input.is_action_just_pressed("start_fishing") and nearby.is_in_group("water"):
		#is_fishing_start = true
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
		#fishing = true
		is_fishing = true
		is_fishing_idling = false
		is_finish_fishing = false
		$"fishing Timer".start()  
		fishing_sound.play()
		print(nearby)
		if nearby.is_in_group("water"):
			#is_fishing_success = true
			
		#if is_fishing_success = true:
			var newfish = FISH.instantiate()
			print("fish ",position)
			newfish.position = position
			print(newfish.position)
			$"..".add_child(newfish)
			#var newfish = FISH.instantiate()
			#print(position)
			#newfish.position = position
			#print(newfish.position)
			#$"..".add_child(newfish)
			
			#if nearby.name == "trees":
			#var newwood = WOOD.instantiate()
			##nearby.add_child(newwood)
			#print(position)
			#newwood.position = position
			#print(newwood.position)
			#$"..".add_child(newwood)
		
	if Input.is_action_just_pressed("chopping"):
		if direction.is_equal_approx(Vector2(0, 1)):
			$AnimatedSprite2D.play("chopping_down")
		elif direction.is_equal_approx(Vector2(0, -1)):
			$AnimatedSprite2D.play("chopping_up")
		elif direction.is_equal_approx(Vector2(-1, 0)):
			$AnimatedSprite2D.play("chopping_left")
		elif direction.is_equal_approx(Vector2(1, 0)):
			$AnimatedSprite2D.play("chopping_right")
		is_chopping = true
		#$"chopping Timer".start()  
		if nearby.name == "trees":
			var newwood = WOOD.instantiate()
			#nearby.add_child(newwood)
			print(position)
			newwood.position = position
			print(newwood.position)
			$"..".add_child(newwood)
			wood_sound.play()
			
	
	if Input.is_action_just_pressed("digging"):
		if direction.is_equal_approx(Vector2(0, 1)):
			$AnimatedSprite2D.play("digging_down")
		elif direction.is_equal_approx(Vector2(0, -1)):
			$AnimatedSprite2D.play("digging_up")
		elif direction.is_equal_approx(Vector2(-1, 0)):
			$AnimatedSprite2D.play("digging_left")
		elif direction.is_equal_approx(Vector2(1, 0)):
			$AnimatedSprite2D.play("digging_right")
		is_digging = true
		#$"digging Timer".start()  

	#
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
		
	if Input.is_action_pressed("cancel"):
			#fishing = false
			is_fishing = false
			is_fishing_idling = false
			is_finish_fishing = false
			is_chopping = false
			is_digging = false
			moving = false
		
	if not moving:
		if is_fishing:
			#fishing = true
			moving = false
			#is_fishing = false
			pass
		
		elif is_fishing_idling:
			#fishing idle
			#fishing = true
			moving = false
			is_fishing = false
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("idle_fishing_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("idle_fishing_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("idle_fishing_right")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("idle_fishing_left")
				
			#$"fishing Timer".start()  
		
		elif is_finish_fishing:
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("finish_fishing_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("finish_fishing_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("finish_fishing_left")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("finish_fishing_right")
				
			#if nearby.name == "river":
				#var newfish = FISH.instantiate()
				#print(position)
				#newfish.position = position
				#print(newfish.position)
				#$"..".add_child(newfish)
				
		elif is_chopping:
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("chopping_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("chopping_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("chopping_left")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("chopping_right")
		
		elif is_digging:
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("digging_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("digging_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("digging_left")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("digging_right")
		
		else:
			walking_sound.stop()
			if direction.is_equal_approx(Vector2(0, 1)):
				$AnimatedSprite2D.play("Idling_down")
			elif direction.is_equal_approx(Vector2(0, -1)):
				$AnimatedSprite2D.play("Idling_up")
			elif direction.is_equal_approx(Vector2(-1, 0)):
				$AnimatedSprite2D.play("Idling_left")
			elif direction.is_equal_approx(Vector2(1, 0)):
				$AnimatedSprite2D.play("Idling_right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	#fishing = false
	moving = false
	is_fishing = false
	is_fishing_idling = true
	is_finish_fishing = true
	is_fishing_success = true
	$"fishing Timer".start()


func _on_fishing_timer_timeout() -> void:
			
	#if Input.is_action_just_pressed("start_fishing"):
		#is_fishing_start = true
	if direction.is_equal_approx(Vector2(0, 1)):
		$AnimatedSprite2D.play("finish_fishing_down")
		#is_finish_fishing = true
		is_fishing = false
		is_fishing_idling = false
		
	elif direction.is_equal_approx(Vector2(0, -1)):
		$AnimatedSprite2D.play("finish_fishing_up")
		#is_finish_fishing = true
		is_fishing = false
		is_fishing_idling = false
	elif direction.is_equal_approx(Vector2(-1, 0)):
		$AnimatedSprite2D.play("finish_fishing_left")
		#is_finish_fishing = true
		is_fishing = false
		is_fishing_idling = false
	elif direction.is_equal_approx(Vector2(1, 0)):
		$AnimatedSprite2D.play("finish_fishing_right")
		#is_finish_fishing = true
		is_fishing = false
		is_fishing_idling = false
	moving = false
	is_fishing = false
	is_fishing_success == true
	catch_sound.play()
	
	if is_fishing_success == true:
		if nearby.name == "river":
			var newfish = FISH.instantiate()
			print(position)
			newfish.position = position
			print(newfish.position)
			$"..".add_child(newfish)
	
func update_ui():
	print(fish_counter)
	print(wood_counter)
	$Camera2D2/bag/fish_counter.text = str(fish_counter)
	$Camera2D2/bag/wood_counter.text = str(wood_counter)


	
#func _on_chopping_timer_timeout() -> void:
	#is_chopping = false
#
#func _on_digging_timer_timeout() -> void:
	#is_digging = false
	

	
	#if Input.is_action_pressed("cancel"):
		##fishing = false
		#is_fishing = false
		#is_fishing_idling = false
		#is_finish_fishing = false
		#moving = false
	#pass # Replace with function body.

var nearby 
func _on_area_2d_body_entered(body: Node2D) -> void:
	nearby = body
	


func _on_wood_counter_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.
