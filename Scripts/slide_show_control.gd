extends StaticBody3D
class_name SlideShowControl

@export_enum('Previous','Next') var action: String

func perform_action() -> void:
	if action == 'Previous':
		SignalBus.previous_slide.emit()
	elif  action == 'Next':
		SignalBus.next_slide.emit()
