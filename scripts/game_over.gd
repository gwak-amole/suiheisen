extends Control
@export var message: Label
@export var cubicle: TextureRect
@export var anim: AnimationPlayer
var rng = RandomNumberGenerator.new()
var chance = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("cubicle_modulate")
	rng.randomize();
	chance = rng.randi_range(0, 3)
	if chance == 0:
		message.text = "it looks like you're working overtime..."
		cubicle.texture = preload("res://assets/game_over_assets/cubicle_game_over_1.png")
	elif chance == 1:
		message.text = "it was worth a shot i guess?"
		cubicle.texture = preload("res://assets/game_over_assets/cubicle_game_over_2.png")
	elif chance == 2:
		message.text = "how was i not fired..?"
		cubicle.texture = preload("res://assets/game_over_assets/cubicle_game_over_3.png")
	elif chance == 3:
		message.text = "maybe in another life."
		cubicle.texture = preload("res://assets/game_over_assets/cubicle_game_over_4.png")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
