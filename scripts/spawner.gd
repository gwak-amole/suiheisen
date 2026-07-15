extends Node3D
@export var left_obstacle = preload("res://scenes/left_obstacle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _spawn_left(spawn_pos: Vector3):
	var obj = left_obstacle.instantiate();
	add_child(obj);
	obj.global_position = spawn_pos


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "left_obstacle":
		body.queue_free();


func _on_timer_timeout() -> void:
	_spawn_left(Vector3(-0.7, 0, -10)); 
	$Timer.start();
