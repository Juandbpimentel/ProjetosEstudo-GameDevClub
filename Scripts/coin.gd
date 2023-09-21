extends Area2D

func _on_body_entered(body):
	if body.is_in_group('Player'):
		Global.moedasPlayer0Atual += 1
		#print('Um pato pode pegar uma moeda???? Agora ele tem '+ str(Global.moedasPlayer0) +' moedas???')
		
		queue_free()
	pass # Replace with function body.
