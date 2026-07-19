extends Node3D

@onready var level = $"../"
var speed = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += speed * delta
	if position.z > 15:
		level.spawn_module(position.z+(-1*level.amount*level.offset))
		queue_free()
