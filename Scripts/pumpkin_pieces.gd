extends Node3D

func explode(impulse_position: Vector3, impulse_intensity: float) -> void:
	$AudioStreamPlayer3D.play()
	for pieces: RigidBody3D in $Pieces.get_children():
		pieces.apply_impulse((pieces.get_child(0).position + impulse_position) * impulse_intensity)

	await get_tree().create_timer(5).timeout
	queue_free()
