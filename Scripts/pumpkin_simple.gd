extends StaticBody3D
class_name Pumpkin

@export var broken_pumpkin: PackedScene

func explode(impulse_position: Vector3, impulse_intensity: float) -> void:
	var broken_pumpkin_instance: Node3D = broken_pumpkin.instantiate()
	get_parent().add_child(broken_pumpkin_instance)
	broken_pumpkin_instance.transform = self.transform
	broken_pumpkin_instance.explode(impulse_position, impulse_intensity)
	queue_free()
