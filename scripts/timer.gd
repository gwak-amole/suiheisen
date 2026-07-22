extends Timer

signal change_speed

var obstacle_speed = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timeout() -> void:
	print("speed is now", obstacle_speed)
	if obstacle_speed < 10:
		obstacle_speed *= 1.01;
	else:
		obstacle_speed = 10
	change_speed.emit()
	start()
	
