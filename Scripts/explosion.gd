extends Node3D

@export var time_scale: float
@export var duration: float

func explode() -> void:
	%AnimationPlayer.play("Explode")
	$WindUp.play()
	await get_tree().create_timer(2.0).timeout
	$Boom.play()
	
func frame_freeze() -> void:
	Engine.time_scale = time_scale
	await  get_tree().create_timer(duration*time_scale).timeout
	Engine.time_scale = 1.0
