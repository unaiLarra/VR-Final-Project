extends Node3D

@export var broken_pumpkin: PackedScene

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		explode()

func explode() -> void:
	var broken_pumpkin_instance: Node3D = broken_pumpkin.instantiate()
	get_parent().add_child(broken_pumpkin_instance)
	broken_pumpkin_instance.transform = self.transform
	queue_free()
