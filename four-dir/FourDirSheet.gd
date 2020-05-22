extends Sprite

tool

enum SIDES{
	DOWN,
	RIGHT,
	UP,
	LEFT
}

export(int) var vframes_per_side = 1
export(SIDES) var side setget set_side
export(int) var action_frame setget set_action_frame
export(Vector2) var action_frame_coord setget set_action_frame_coord
export(bool) var is_symmetrical = false

func set_side(i):
	side = i
	
	# IF THE SPRITE IS SYMMETRICAL,
	#	LEFT IS RIGHT + FLIP HORIZONTAL
	if is_symmetrical:
		if side == SIDES.LEFT:
			side = SIDES.RIGHT
			set_flip_h(true)
		else:
			set_flip_h(false)
	
	calc_frame()
	pass

func set_action_frame(i):
	action_frame = i
	calc_frame()
	pass

func set_action_frame_coord(v2):
	set_action_frame(v2.y * get_hframes() + v2.x)
	pass

func calc_frame():
	frame = hframes * vframes_per_side * side + action_frame
	pass
