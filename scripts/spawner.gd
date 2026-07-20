extends Node3D

signal add_points
signal hurt

@export var obstacle = preload("res://scenes/obstacle.tscn")
@export var gc: Node
@export var timer: Timer
var rng = RandomNumberGenerator.new();
var chance_array = [1, 2, 3];
var weights = PackedFloat32Array([1, 1, 1.2])
var chance: int;
var spawn_cap = 3
var obs_in_scene = 0;
var cooldown = 1.0
var just_spawned = false;
var tell_gc = true;

func _ready() -> void:
	chance = chance_array[rng.rand_weighted(weights)];
	gc.connect("faster", increase_spawn_freq);
	obs_in_scene = 0;

func _process(delta: float) -> void:
	pass
	
	
func _spawn(spawn_pos: Vector3):
	if obs_in_scene < spawn_cap && !just_spawned:
		var obj = obstacle.instantiate();
		add_child(obj);
		obs_in_scene += 1;
		obj.global_position = spawn_pos
		if chance == 1:
			obj.global_position.x = obj.side_offset
		elif chance == 2:
			obj.global_position.x = obj.side_offset * -1
		if chance == 3: 
			pass
		else:
			obj.global_position.y = obj.y_offset
		just_spawned = true;
		await get_tree().create_timer(cooldown).timeout
		just_spawned = false;

func _on_timer_timeout() -> void:
	if chance == 1:
		_spawn(Vector3(0, 0, -10)); 
	elif chance == 2:
		_spawn(Vector3(0, 0, -10));
	elif chance == 3:
		_spawn(Vector3(0, 3.6, -10));
	chance = chance_array[rng.rand_weighted(weights)]; 
	timer.start();

func increase_spawn_freq():
	timer.wait_time *= 0.99
	cooldown *= 0.9

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.name.contains("obstacle_area"):
		if area.name.contains("hit"):
			hurt.emit()
		else:
			add_points.emit()
		area.get_parent_node_3d().queue_free();
		obs_in_scene-=1;
