extends Node2D



func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		queue_free()
		
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass