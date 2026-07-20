extends Node3D
@export var modules: Array[PackedScene] = [];
var amount = 20;
var offset = 2;
var isFirst = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in amount:
		spawn_module(n*offset*-1)


func spawn_module(n):
	if isFirst:
		var instance = modules[0].instantiate();
		instance.position.z = n;
		add_child(instance)
		isFirst = false;
	else:
		var instance2 = modules[1].instantiate();
		instance2.position.z = n;
		add_child(instance2)
		isFirst = true;
