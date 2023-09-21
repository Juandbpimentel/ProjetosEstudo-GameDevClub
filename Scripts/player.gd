extends CharacterBody2D
var grav = 18
var speed = 200
var jump_force = 380
var jumping = false
var walking = false
var gliding = false
var falling = false

var jumpClick = false
var chave = false 

@onready var animation := $AnimationPlayer as AnimationPlayer
# Called when the node enters the scene tree for the first time.

func _ready():
	match Global.player0Health:
		2:
				$CanvasLayer/HeartSprite3.visible = false
		1:
				$CanvasLayer/HeartSprite2.visible = false
				$CanvasLayer/HeartSprite3.visible = false
		0:
				$CanvasLayer/HeartSprite1.visible = false
				$CanvasLayer/HeartSprite2.visible = false
				$CanvasLayer/HeartSprite3.visible = false


func _process(_delta):
	updateHud()

func _physics_process(_delta):
	jump_processing()
	movement_and_animation()
	move_and_slide()
	setar_animacao()
	pass

func _input(event):
	if event is InputEventScreenTouch:
		jump_processing()


# Implemented functions

#Hud Verifications

func updateHud():
	$CanvasLayer/Coins.text = str(Global.moedasPlayer0Atual)
	
	if chave == true:
		$CanvasLayer/keySprite.visible = true
	else:
		$CanvasLayer/keySprite.visible = false
	



func jump_processing():
	if !is_on_floor():
		velocity.y += grav
		jumping = true
		if velocity.y > 0:
			if (Input.is_key_pressed(KEY_SPACE) || Input.is_joy_button_pressed(0,JOY_BUTTON_B) || Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W) || Input.is_action_just_pressed("jump")) :
				velocity.y = 100
				gliding = true
				falling = false
			else:
				gliding = false
				falling = true
	else:
		jumping = false
		gliding = false
		falling = false
		if (Input.is_action_just_pressed("jump")) :			
			velocity.y -= jump_force
			jumping = true

func movement_and_animation():
		if Input.is_action_pressed('move_right'):
			velocity.x = speed
			$Sprite2D.flip_h = false
			$CollisionPolygon2D.scale.x = 1
			walking = true

		elif Input.is_action_pressed('move_left'):
			velocity.x = -speed
			$Sprite2D.flip_h = true
			$CollisionPolygon2D.scale.x = -1
			walking = true
		else:
			velocity.x = 0
			walking = false

func setar_animacao():
	var state = "idle"

	if gliding:
		state = "gliding"
	elif falling:
		state = "falling"
	elif jumping:
		state = "jumping"
	elif walking:
		state = 'walking'
	
	if animation.name != state:
		animation.play(state)


func _on_area_2d_body_entered(body):
	if body.is_in_group("Inimigo"):
		if (velocity.y > 0 && position.y < body.position.y):
			body.queue_free()
		else:
			Global.dealDamagePlayer()
