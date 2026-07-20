extends CharacterBody3D

@export var mesh_array: Array[PackedScene] = [];
var rng = RandomNumberGenerator.new()
var side_offset: float;
var y_offset: float;

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready():
	rng.randomize()
	var obstacle = mesh_array.pick_random().instantiate();
	side_offset = obstacle.side_offset
	y_offset = obstacle.y_offset
	add_child(obstacle)

func _physics_process(delta: float) -> void:
	var direction = Vector3.BACK;
	velocity.z = direction.z * SPEED
	
	
	move_and_slide()
