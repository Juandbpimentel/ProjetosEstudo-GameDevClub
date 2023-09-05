extends Area2D
@export var world = PackedScene

var passou_de_fase = false

func _on_body_entered(body):
	if body.is_in_group('Player'):
		if body.chave == true:
			if passou_de_fase == false:
				$Timer.start()
				$AnimationPlayer.play("open")
				body.chave = false
				passou_de_fase = true
		else:
			print('você não tem a chave')
	pass # Replace with function body.


func _on_timer_timeout():
	get_tree().change_scene_to_packed(world)
	pass # Replace with function body.
