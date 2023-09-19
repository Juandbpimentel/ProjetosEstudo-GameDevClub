extends CharacterBody2D

var player = null
var speed = 80
var dir = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("flying")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player:
		dir = (player.global_position - global_position).normalized()
		velocity = speed * dir
		move_and_slide()
	else:
		velocity = Vector2.ZERO
	pass

func _on_kill_area_body_entered(body):
	if body.is_in_group('Player'):
		Global.moedasPlayer0 = 0
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_follow_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		player = body
		print(player)
	pass # Replace with function body.

func _on_follow_area_2d_body_exited(body):
	if body.is_in_group('Player'):
		player = null
	pass # Replace with function body.


