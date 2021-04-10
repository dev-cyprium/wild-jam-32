extends KinematicBody2D

export(Texture) var character_right

var facing = 'right'
var moves = {
	'right': Vector2.RIGHT,
	'left': Vector2.LEFT,
	'up': Vector2.UP,
	'down': Vector2.DOWN,
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
	
	var _ret = move_and_slide(moves[dir] * vel, Vector2.UP)
