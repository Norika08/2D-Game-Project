extends ProgressBar

@export var character:CharacterBody2D


func update():
	character.healthChanged.connect(update)
	value = character.currentHealth * 100 / character.maxHealth



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
