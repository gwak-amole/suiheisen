extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	var direction = Vector3.BACK;
	velocity.z = direction.z * SPEED
	
	
	
	move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("OI HIT")
