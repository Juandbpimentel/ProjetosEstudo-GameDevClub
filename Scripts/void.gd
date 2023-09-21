extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
		Global.dealDamagePlayer()
	pass # Replace with function body.
