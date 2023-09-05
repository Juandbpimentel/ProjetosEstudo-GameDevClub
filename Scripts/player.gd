extends CharacterBody2D
var grav = 10
var speed = 200
var jump_force = 350
var jumping = false
var jumpClick = false
var chave = false 
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	jump_processing()
	movement_and_animation()
	move_and_slide()
	pass




func jump_processing():
	if !is_on_floor():
		velocity.y += grav
	else:
		jumping = false
		if (Input.is_key_pressed(KEY_SPACE) || Input.is_joy_button_pressed(0,JOY_BUTTON_B) || Input.is_key_pressed(KEY_UP)) && !jumpClick :
			velocity.y -= jump_force
			jumpClick = true
			jumping = true
	if !Input.is_key_pressed(KEY_SPACE) && !Input.is_joy_button_pressed(0,JOY_BUTTON_B) && !Input.is_key_pressed(KEY_UP) :
		jumpClick = false




func movement_and_animation():
	if jumping:
		$AnimationPlayer.play("jumping")
		if Input.is_action_pressed('ui_right'):
			velocity.x = speed
			$Sprite2D.flip_h = false

		elif Input.is_action_pressed('ui_left'):
			velocity.x = -speed
			$Sprite2D.flip_h = true
		else:
			velocity.x = 0
	else:
		if Input.is_action_pressed('ui_right'):
			velocity.x = speed
			$Sprite2D.flip_h = false
			$AnimationPlayer.play("walking")

		elif Input.is_action_pressed('ui_left'):
			velocity.x = -speed
			$Sprite2D.flip_h = true
			$AnimationPlayer.play("walking")
		else:
			velocity.x = 0
			$AnimationPlayer.play("idle")

#func _input(event):
	#print(event.as_text())
	#if Input.is_joy_button_pressed(0,JOY_BUTTON_A):
	#	print('botão A')
