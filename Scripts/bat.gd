extends CharacterBody2D

var player = null
var speed = 80
var dir = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("flying")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player:
		dir = (player.global_position - global_position).normalized()
		velocity = speed * dir
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func _on_follow_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		player = body
		print(player)

func _on_follow_area_2d_body_exited(body):
	if body.is_in_group('Player'):
		player = null


