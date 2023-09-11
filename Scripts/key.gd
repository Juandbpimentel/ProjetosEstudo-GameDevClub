extends Area2D


func _on_body_entered(body):
	if body.is_in_group('Player'):
		print('Um pato pode pegar uma chave?????')
		body.chave = true
		queue_free()
	pass # Replace with function body.
