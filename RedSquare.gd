extends KinematicBody2D

var direction_v:Vector2 = Vector2()
const speed = 64
signal moving

var is_busy:bool = false
signal business

func _ready():
	connect("moving", self, "_on_moving")
	connect("moving", $AnimationTree, "_on_moving")
	connect("business", $AnimationTree, "_on_business_change")
	pass

func _physics_process(delta):
	var movement = Vector2()
	if direction_v:
		movement = direction_v * speed
	
	move_and_slide(movement)
	pass

func _input(event):
	if event is InputEventKey or event is InputEventJoypadButton:
		# MOVEMENT
		if !is_busy:
			if event.is_action("ui_left") or event.is_action("ui_right"):
				direction_v.x = 0
				if event.is_action_pressed("ui_left", true):
					direction_v.x -= 1
				elif event.is_action_pressed("ui_right", true):
					direction_v.x += 1
			elif event.is_action("ui_up") or event.is_action("ui_down"):
				direction_v.y = 0
				if event.is_action_pressed("ui_up", true):
					direction_v.y -= 1
				elif event.is_action_pressed("ui_down", true):
					direction_v.y += 1
			emit_signal("moving", direction_v)
		
		# ACTION
		if event.is_action_pressed("ui_select", false):
			is_busy = true
			emit_signal("business", is_busy)
		elif event.is_action_released("ui_select"):
			is_busy = false
			emit_signal("business", is_busy)

	elif event is InputEventJoypadMotion:
		if !is_busy:
			if event.is_action("ui_left"):
				if event.get_action_strength("ui_left"):
					direction_v.x = -event.get_action_strength("ui_left")
				else:
					direction_v.x = event.get_action_strength("ui_right")
			elif event.is_action("ui_up"):
				if event.get_action_strength("ui_up"):
					direction_v.y = -event.get_action_strength("ui_up")
				else:
					direction_v.y = event.get_action_strength("ui_down")
			emit_signal("moving", direction_v)
	pass

func _on_moving(direction:Vector2):
	direction_v = direction
	pass
