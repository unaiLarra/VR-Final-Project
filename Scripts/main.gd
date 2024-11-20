extends Node3D

@export var xr_controller: PackedScene
@export var normal_controller: PackedScene

var xr_interface: XRInterface

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		var xr_controller_instance = xr_controller.instantiate()
		add_child(xr_controller_instance)
		xr_controller_instance.global_position = %SpawnPosition.global_position
		get_viewport().use_xr = true
	else:
		printerr("OpenXR not initialized, starting game with normal controller")
		var normal_controller_instance = normal_controller.instantiate()
		add_child(normal_controller_instance)
		normal_controller_instance.global_position = %SpawnPosition.global_position
