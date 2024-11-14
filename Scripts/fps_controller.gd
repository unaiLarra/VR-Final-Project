extends CharacterBody3D

@export var mouse_sensitivity: float = 0
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var event_relative: Vector2 = (event.relative * 500 / get_viewport().size.y) * Vector2(1,0.5)
		rotate_and_displace(event_relative)

func rotate_and_displace(event_relative: Vector2) -> void:
	rotate_y(deg_to_rad(-event_relative.x * mouse_sensitivity))
	%XPivot.rotate_x(deg_to_rad(-event_relative.y * mouse_sensitivity))
	%XPivot.rotation.x = clamp(
		%XPivot.rotation.x, deg_to_rad(-90), deg_to_rad(90)
	)
