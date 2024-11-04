extends Area2D

@onready var collect_sound = $collect
#onready var label :=$wood_counter


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		collect_sound.play()
		queue_free()
		#label.text= collect_wood + 1

		
		
		
		
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
