extends AnimationTree

var state_sides = get("parameters/Sides/playback")
var add_actions = get("parameters/StateSideY/playback")
var state_actions = get("parameters/Actions/playback")

var is_walking: bool = false

func _ready():
	pass
	
func _on_moving(direction:Vector2):
	
	if direction.y > 0:
		state_sides.travel("Down")
	elif direction.y < 0:
		state_sides.travel("Up")
	elif direction.x < 0:
		state_sides.travel("Left")
	elif direction.x > 0:
		state_sides.travel("Right")
	
	if direction:
		is_walking = true
		state_actions.travel("Walking")
	else:
		is_walking = false
		state_actions.travel("Idle")
	
	pass

func _on_business_change(b:bool):
	if b:
		state_actions.travel("Dancing")
	else:
		if is_walking:
			state_actions.travel("Walking")
		else:
			state_actions.travel("Idle")
	pass
