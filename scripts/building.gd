extends Node3D

@onready var level = $"../"
var speed = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += speed * delta
	if position.z > 15:
		get_parent().spawn_module(position.z+(-1*get_parent().amount*get_parent().offset))
		queue_free()
