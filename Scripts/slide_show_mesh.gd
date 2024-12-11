extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("finish_slide_show",Callable(self,"finished"))

func finished() -> void:
	queue_free()
