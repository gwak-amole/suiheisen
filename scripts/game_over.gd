extends Control
@export var message: Label
var rng = RandomNumberGenerator.new()
var chance = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize();
	chance = rng.randi_range(0, 3)
	if chance == 0:
		message.text = "it looks like you're working overtime..."
	elif chance == 1:
		message.text = "it was worth a shot i guess?"
	elif chance == 2:
		message.text = "how was i not fired..?"
	elif chance == 3:
		message.text = "maybe in another life."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
