extends CharacterBody3D

@export var mesh_array: Array[PackedScene] = [];
@export var limbo_array: Array[PackedScene] = [];
var rng = RandomNumberGenerator.new()
var side_offset: float;
var y_offset: float;
var is_limbo = false;
var is_initialized = false;

var SPEED = 5.0

func initialize():
	SPEED = GlobalTimer.obstacle_speed
	GlobalTimer.connect("change_speed", change_speed)
	rng.randomize()
	if is_limbo:
		var obstacle = limbo_array.pick_random().instantiate();
		side_offset = obstacle.side_offset
		y_offset = obstacle.y_offset
		add_child(obstacle)
	else:
		var obstacle = mesh_array.pick_random().instantiate();
		side_offset = obstacle.side_offset
		y_offset = obstacle.y_offset
		add_child(obstacle)
	is_initialized = true;

func _physics_process(delta: float) -> void:
	if is_initialized:
		var direction = Vector3.BACK;
		velocity.z = direction.z * SPEED
	
	move_and_slide()
func change_speed():
	SPEED = GlobalTimer.obstacle_speed
