extends Node3D

@export var bullet: PackedScene
@export var shot_velocity: float = 20.0

var xr_interface
var picked_up := false

func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")

func shoot() -> void:
	var direction: Vector3 = %BulletOrigin.global_position - %ShootingOrigin.global_position
	direction = direction.normalized()
	SignalBus.shoot_projectile.emit(%BulletOrigin.global_position, direction * shot_velocity, bullet)
	%MuzzleFlash.material_override.set_shader_parameter('View Index',randi_range(0,1))
	print(%MuzzleFlash.material_override.get_shader_parameter('View Index'))
	%AnimationPlayer.play("Shoot")
	$Gunshot.play()

func _on_pickable_object_action_pressed(pickable: Variant) -> void:
	shoot()
