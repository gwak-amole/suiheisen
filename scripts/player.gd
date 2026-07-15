extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var anim: AnimatedSprite3D

func _ready():
	anim.play("run");
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("z"):
		anim.play("dodge_to_left")
	elif Input.is_action_just_pressed("v"):
		anim.play("dodge_to_right")
	elif Input.is_action_just_pressed("c"):
		anim.play("limbo");
	elif Input.is_action_just_pressed("x"):
		anim.play("run")

	move_and_slide()
