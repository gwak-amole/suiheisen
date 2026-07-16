extends Node
signal faster
@export var spawner: Node3D;
@export var timer: Timer;
@export var points_label: Label
@export var horizon: TextureProgressBar
var hit = false;
var points: int = 0;
var points_inc = 5;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawner.add_points.connect(add_points)
	spawner.hurt.connect(hurt)
	hit = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	points_inc *= 1.02;
	faster.emit()
	timer.start()
	
func add_points():
	points += points_inc;
	points = int(points);
	points_label.text = str(points);

func hurt():
	horizon.value = maxf(horizon.value - horizon.step, horizon.min_value)
	if horizon.value == 0:
		pass # game over
