@tool
extends Control

@export var active_slide: int = 0:
	set(value):
		active_slide = clamp(value, 0, get_slide_count() - 1)


func _ready() -> void:
	active_slide = 0
	SignalBus.connect("next_slide", Callable(self,'next_slide'))
	SignalBus.connect("previous_slide", Callable(self,'previous_slide'))


func _process(delta: float) -> void:
	var index = 0
	for child: Node in get_children():
		if child is Control and child is not SubViewportContainer:
			if index == active_slide:
				child.visible = true
			else:
				child.visible = false
			index += 1


func get_slide_count() -> int:
	var count = 0
	for child in get_children():
		if child is Control:
			count += 1
	return count

func next_slide() -> void:
	if active_slide == get_slide_count()-1:
		SignalBus.finish_slide_show.emit()
		return
	active_slide += 1

func previous_slide() -> void:
	active_slide -= 1
