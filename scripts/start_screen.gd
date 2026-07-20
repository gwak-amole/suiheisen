extends Control
@export var anim_blink: AnimatedSprite2D
@export var anim: AnimationPlayer
@export var black: ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_blink.show()
	black.show()
	await get_tree().create_timer(2.0).timeout
	get_tree().paused = true
	anim_blink.play("default")
	black.hide()
	await anim_blink.animation_finished
	anim_blink.hide()
	get_tree().paused = false
	anim.play("start_screen_movement")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("x"):
		anim.play("fade_out")
		black.show()
		await anim.animation_finished
		get_tree().change_scene_to_file("res://scenes/main.tscn")
