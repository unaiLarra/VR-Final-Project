extends XRController3D

var picked_object: XRToolsPickable

func _on_function_pickup_has_picked_up(what: Variant) -> void:
	picked_object = what

func _on_function_pickup_has_dropped() -> void:
	picked_object = null
