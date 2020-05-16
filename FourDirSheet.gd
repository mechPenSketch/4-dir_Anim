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
export(bool) var is_symmetrical = false

func _ready():
	pass

func set_side(i):
	side = i
	calc_frame()
	pass

func set_action_frame(i):
	action_frame = i
	calc_frame()
	pass

func calc_frame():
	frame = hframes * vframes_per_side * side + action_frame
	pass
