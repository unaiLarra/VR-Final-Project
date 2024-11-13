extends XRCamera3D

func _ready() -> void:
	# Create two Spatial nodes, one for each eye.
	var left_eye_cull = Node3D.new()
	var right_eye_cull = Node3D.new()

	# Set the culling mask for each eye.
	left_eye_cull.cull_mask = 1 << 8 # Set the culling mask to layer 8.
	right_eye_cull.cull_mask = 1 << 9 # Set the culling mask to layer 9.

	# Attach the nodes to the left and right eyes of the XR camera.
	left_eye.add_child(right_eye_cull)
	right_eye.add_child(right_eye_cull)
