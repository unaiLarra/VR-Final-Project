extends RigidBody3D
class_name Shot

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var last_velocity: Vector3

func _ready() -> void:
	await get_tree().create_timer(4).timeout

func _physics_process(delta: float) -> void:
	last_velocity = linear_velocity

func _on_body_entered(body: Node) -> void:
	if body is Pumpkin:
		var impulse_position = last_velocity * 0.009
		body.explode(impulse_position, last_velocity.length() * 0.11)
	queue_free()
