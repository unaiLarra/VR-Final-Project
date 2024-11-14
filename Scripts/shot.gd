extends Area3D
class_name Shot

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var velocity := Vector3.ZERO

func _ready() -> void:
	await get_tree().create_timer(6).timeout

func _physics_process(delta: float) -> void:
	velocity -= Vector3(0,get_gravity() * delta,0)
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta


func _on_area_entered(area: Area3D) -> void:
	if area is Pumpkin:
		var impulse_position = -velocity * 0.03
		print('impulse position:',impulse_position,' area_position:',area.global_position)
		area.explode(impulse_position, velocity.length() * 0.2)
	queue_free()
