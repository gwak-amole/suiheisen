extends CharacterBody3D

@export var mesh_array: Array[PackedScene] = [];

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready():
	var obstacle = mesh_array[0].instantiate();
	obstacle.position = global_position
	add_child(obstacle)

func _physics_process(delta: float) -> void:
	var direction = Vector3.BACK;
	velocity.z = direction.z * SPEED
	
	
	move_and_slide()
