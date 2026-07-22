extends Node3D
@export var modules: Array[PackedScene] = [];
var amount = 10;
var offset = 14;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in amount:
		spawn_module(n*offset*-1)


func spawn_module(n):
	var instance = modules.pick_random().instantiate();
	instance.is_left = true;
	instance.position.z = n;
	instance.position.x = -10;
	add_child(instance)
	var instance2 = modules.pick_random().instantiate();
	instance2.is_left = false;
	instance2.position.z = n;
	instance2.position.x = 10;
	instance2.rotation_degrees.y = 180
	add_child(instance2)
