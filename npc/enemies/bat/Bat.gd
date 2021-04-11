extends KinematicBody2D

enum State {
	WANDER,
	CHASE
}

var state = State.WANDER
var acc = Vector2.ZERO
var vel = Vector2.ZERO
var target = null
var original_position = null

func _ready():
	original_position = position
	$AnimationPlayer.play("wander")

func arrive(target):		
	var desired = target - position
	var d = desired.length()
	
	if (d < 5):
		self.target = null
	
	var speed = 30
	desired = desired.normalized() * speed
	var steer = desired - vel
	acc += steer

func _physics_process(delta):
	if target == null:
		var angle_rad = rand_range(0, 2*PI)
		var r = int(rand_range(50, 100))
		target = original_position + Vector2(cos(angle_rad), sin(angle_rad)) * r
	
	if target:
		arrive(target)
		
		vel += acc
		acc *= 0
		move_and_slide(vel)
		update()
	
	move_and_slide(vel)

func _draw():
	if target:
		draw_line(Vector2.ZERO, target - position, Color.red)
