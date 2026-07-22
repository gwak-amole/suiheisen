extends Node
signal faster
signal game_over
@export var hurt_audio: AudioStreamPlayer
@export var spawner: Node3D;
@export var timer: Timer;
@export var points_label: Label
@export var horizon: TextureProgressBar
@export var anim: AnimationPlayer
@export var fade_texture: ColorRect
@export var instructions: Node
@export var pause_menu: Panel
var hit = false;
var points: int = 0;
var points_inc = 5;
var instructions_shown = true;
var pause_shown = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_shown = false
	pause_menu.hide()
	get_tree().paused = true
	instructions_shown = true;
	instructions.show()
	fade_texture.hide()
	spawner.add_points.connect(add_points)
	spawner.hurt.connect(hurt)
	hit = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if instructions_shown and Input.is_action_just_pressed("x"):
		instructions_shown = false;
		instructions.hide();
		get_tree().paused = false;
	if !instructions_shown and Input.is_action_just_pressed("ui_cancel") and !pause_shown:
		pause_menu.show();
		get_tree().paused = true
		pause_shown = true;
		
func _on_timer_timeout() -> void:
	points_inc *= 1.02;
	faster.emit()
	timer.start()
	
func add_points():
	points += points_inc;
	points = int(points);
	points_label.text = str(points);

func hurt():
	hurt_audio.play()
	horizon.value = maxf(horizon.value - horizon.step, horizon.min_value)
	if horizon.value == 0:
		game_over.emit();
		fade_texture.show()
		anim.play("fade_out")
		await anim.animation_finished
		if is_inside_tree():
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_resume_pressed() -> void:
	pause_shown = false
	pause_menu.hide();
	get_tree().paused = false;


func _on_quit_pressed() -> void:
	pause_shown = false
	get_tree().paused = false;
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
