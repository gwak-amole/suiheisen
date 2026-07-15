extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var anim: AnimatedSprite3D
@export var collider: CollisionShape3D
@export var left_collider: CollisionShape3D
@export var right_collider: CollisionShape3D
@export var limbo_collider: CollisionShape3D


func _ready():
	anim.play("run");
	left_collider.set_deferred("disabled", true)
	right_collider.set_deferred("disabled", true)
	limbo_collider.set_deferred("disabled", true)
	
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("z"):
		anim.play("dodge_to_left")
		collider.set_deferred("disabled", true)
		left_collider.set_deferred("disabled", false)
		right_collider.set_deferred("disabled", true)
		limbo_collider.set_deferred("disabled", true)
	elif Input.is_action_just_pressed("v"):
		anim.play("dodge_to_right")
		collider.set_deferred("disabled", true)
		left_collider.set_deferred("disabled", true)
		right_collider.set_deferred("disabled", false)
		limbo_collider.set_deferred("disabled", true)
	elif Input.is_action_just_pressed("c"):
		anim.play("limbo");
		collider.set_deferred("disabled", true)
		left_collider.set_deferred("disabled", true)
		right_collider.set_deferred("disabled", true)
		limbo_collider.set_deferred("disabled", false)
	elif Input.is_action_just_pressed("x"):
		anim.play("run")
		collider.set_deferred("disabled", false)
		left_collider.set_deferred("disabled", true)
		right_collider.set_deferred("disabled", true)
		limbo_collider.set_deferred("disabled", true)

	move_and_slide()


func _on_timer_timeout() -> void:
	anim.play("run")
	collider.set_deferred("disabled", false)
	left_collider.set_deferred("disabled", true)
	right_collider.set_deferred("disabled", true)
	limbo_collider.set_deferred("disabled", true)
