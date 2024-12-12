extends Node3D

func play_step() -> void:
	var idx := randi() % 3
	if idx == 0:
		$StepSound0.pitch_scale = randf_range(0.8, 1.2)
		$StepSound0.play()
	if idx == 0:
		$StepSound1.pitch_scale = randf_range(0.8, 1.2)
		$StepSound1.play()
	else:
		$StepSound2.pitch_scale = randf_range(0.8, 1.2)
		$StepSound2.play()
