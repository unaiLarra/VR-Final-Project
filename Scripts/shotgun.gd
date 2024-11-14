extends Node3D

@export var bullet: PackedScene

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		print('Shooting!')
		shoot()

func shoot() -> void:
	var direction: Vector3 = %BulletOrigin.global_position - %ShootingOrigin.global_position
	direction = direction.normalized()
	print('Direction: ',direction)
