extends CharacterBody3D

@export var mouse_sensitivity: float = 0

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		print('Getting mouse input')
		var event_relative: Vector2 = event.relative * 500 / get_viewport().size.y
		rotate_and_displace(event_relative)

func rotate_and_displace(event_relative: Vector2) -> void:
	rotate_y(deg_to_rad(-event_relative.x * mouse_sensitivity))
	%XPivot.rotate_x(deg_to_rad(-event_relative.y * mouse_sensitivity))
	%XPivot.rotation.x = clamp(
		%XPivot.rotation.x, deg_to_rad(-90), deg_to_rad(90)
	)
