extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pickable_object_body_entered(body):
	if body is Pumpkin:
		var vel = get_parent().linear_velocity
		var impulse_position = vel * 0.009
		body.explode(impulse_position, vel.length() * 0.11)
