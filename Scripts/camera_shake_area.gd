extends Area3D

@export var trauma_reduction_rate := 1.0
@export var noise_speed := 50
@export var noise: FastNoiseLite
@export_group("Camera angles")
@export var max_x := 10.0
@export var max_y := 10.0
@export var max_z := 5.0

var fixed_trauma := 0.0
var fixed_trauma_duration := 0.0

var trauma := 0.0
var time := 0.0

@onready var camera := %XRCamera3D as Camera3D
@onready var initial_rotation := camera.rotation_degrees as Vector3


func _process(delta: float) -> void:
	time += delta
	trauma = max(trauma - delta * trauma_reduction_rate, 0.0)

	camera.rotation_degrees.x = (
		initial_rotation.x + max_x * get_shake_intensity() * get_noise_from_seed(0)
	)
	camera.rotation_degrees.y = (
		initial_rotation.y + max_y * get_shake_intensity() * get_noise_from_seed(1)
	)
	camera.rotation_degrees.z = (
		initial_rotation.z + max_z * get_shake_intensity() * get_noise_from_seed(2)
	)

	if fixed_trauma_duration:
		fixed_trauma_duration = max(fixed_trauma_duration - delta, 0.0)
		camera.rotation_degrees.x = (
			initial_rotation.x + max_x * get_fixed_shake_intensity() * get_noise_from_seed(0)
		)
		camera.rotation_degrees.y = (
			initial_rotation.y + max_y * get_fixed_shake_intensity() * get_noise_from_seed(1)
		)
		camera.rotation_degrees.z = (
			initial_rotation.z + max_z * get_fixed_shake_intensity() * get_noise_from_seed(2)
		)


func add_trauma(trauma_amnt: float) -> void:
	trauma = clamp(trauma + trauma_amnt, 0.0, 1.0)


func add_fixed_trauma(trauma_amnt: float, duration: float) -> void:
	fixed_trauma = trauma_amnt
	fixed_trauma_duration = duration


func get_shake_intensity() -> float:
	return trauma * trauma


func get_fixed_shake_intensity() -> float:
	return fixed_trauma * fixed_trauma


func get_noise_from_seed(new_seed: int) -> float:
	noise.seed = new_seed
	return noise.get_noise_1d(time * noise_speed)
