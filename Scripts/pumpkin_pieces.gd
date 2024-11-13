extends Node3D

@export var intensity: float = 8.0

func _ready() -> void:
	for pieces: RigidBody3D in get_children():
		pieces.apply_impulse(
			pieces.get_child(0).position * intensity,
			global_position + Vector3(randf_range(-0.1,0.1),randf_range(-0.05,0.05), randf_range(-0.1,0.1))
			)
	
	await get_tree().create_timer(5).timeout
	queue_free()
