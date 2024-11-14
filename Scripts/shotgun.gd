extends Node3D

@export var bullet: PackedScene
@export var shot_velocity: float = 20.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		print('Shooting!')
		shoot()

func shoot() -> void:
	var direction: Vector3 = %BulletOrigin.global_position - %ShootingOrigin.global_position
	direction = direction.normalized()
	SignalBus.shoot_projectile.emit(%BulletOrigin.global_position, direction * shot_velocity, bullet)
	print('Direction: ',direction)
