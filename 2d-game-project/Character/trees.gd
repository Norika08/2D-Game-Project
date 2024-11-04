extends TileMapLayer

@onready var collect_sound =$collect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		collect_sound.play()
		body.wood_counter += 1
		body.update_ui()
		queue_free()
