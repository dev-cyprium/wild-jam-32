extends "res://Character.gd"

var speed = 64

func _process(delta):
	for dir in moves.keys():
		if Input.is_action_pressed(dir):
			move(dir, speed)
