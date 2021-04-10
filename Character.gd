extends KinematicBody2D

export(Texture) var character_right

var facing = 'right'
var moves = {
	'right': Vector2(1, 0),
	'left': Vector2(-1, 0),
	'up': Vector2(0, -1),
	'down': Vector2(0, 1)
}

onready var move_textures = {
	'right': character_right,
	'left': character_right,
	'up': character_right,
	'down': character_right,
}

func _ready():
	$Sprite.texture = character_right
	$AnimationPlayer.play("move")

func move(dir, vel):
	facing = dir
	
	$Sprite.texture = move_textures[dir];
	
	if ($AnimationPlayer.current_animation != "move"):
		$AnimationPlayer.play("move")
	
	move_and_slide(moves[dir] * vel, Vector2.UP)
