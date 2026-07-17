extends Control
@export var anim_blink: AnimatedSprite2D
@export var anim: AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_blink.show()
	get_tree().paused = true
	anim_blink.play("default")
	await anim_blink.animation_finished
	anim_blink.hide()
	get_tree().paused = false
	anim.play("start_screen_movement")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
