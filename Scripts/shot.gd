extends CharacterBody3D
class_name Shot

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	var collision := move_and_collide(velocity * delta)
