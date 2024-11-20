extends Node3D


func _ready() -> void:
	SignalBus.connect("shoot_projectile", Callable(self, "spawn_bullet"))

func spawn_bullet(spawn_position: Vector3, velocity: Vector3, bullet: PackedScene) -> void:
	var bullet_instance := bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.global_position = spawn_position
	bullet_instance.apply_central_impulse(velocity)
