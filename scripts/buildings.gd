extends Node3D
@export var building_modules: Array[PackedScene] = [];
var amount = 20;
var offset = 2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in amount:
		spawn_module(n*offset*-1)


func spawn_module(n):
	var instance = building_modules.pick_random().instantiate();
	instance.position.z = n;
	add_child(instance)
