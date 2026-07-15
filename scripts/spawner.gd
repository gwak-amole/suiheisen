extends Node3D
@export var obstacle = preload("res://scenes/obstacle.tscn")
var rng = RandomNumberGenerator.new();
var chance_array = [1, 2, 3];
var weights = PackedFloat32Array([1, 1, 1.2])
var chance: int;

func _ready() -> void:
	chance = chance_array[rng.rand_weighted(weights)];


func _process(delta: float) -> void:
	pass
	
	
func _spawn(spawn_pos: Vector3):
	var obj = obstacle.instantiate();
	add_child(obj);
	obj.global_position = spawn_pos


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name.containsn("obstacle"):
		print("queue freed")
		body.queue_free();


func _on_timer_timeout() -> void:
	if chance == 1:
		_spawn(Vector3(-0.7, 0, -10)); 
	elif chance == 2:
		_spawn(Vector3(0.7, 0, -10));
	elif chance == 3:
		_spawn(Vector3(0, 3.9, -10));
	chance = chance_array[rng.rand_weighted(weights)]; 
	$Timer.start();
