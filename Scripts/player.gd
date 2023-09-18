extends CharacterBody2D
var grav = 10
var speed = 200
var jump_force = 300
var jumping = false
var walking = false

var jumpClick = false
var chave = false 

@onready var animation := $AnimationPlayer as AnimationPlayer
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


func _process(_delta):
	$CanvasLayer/Coins.text = str(Global.moedasPlayer0)
	if chave == true:
		$CanvasLayer/keySprite.visible = true
	else:
		$CanvasLayer/keySprite.visible = false

func _physics_process(_delta):
	jump_processing()
	movement_and_animation()
	move_and_slide()
	setar_animacao()
	pass

func _input(event):
	#print(event.as_text())
	if event is InputEventScreenTouch:
		jump_processing()
	#print(event.as_text())
	#if Input.is_joy_button_pressed(0,JOY_BUTTON_A):
	#	print('botão A')


# Implemented functions
func jump_processing():
	if !is_on_floor():
		velocity.y += grav
		jumping = true
	else:
		jumping = false
		if (Input.is_key_pressed(KEY_SPACE) || Input.is_joy_button_pressed(0,JOY_BUTTON_B) || Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W) || Input.is_action_just_pressed("jump")) && !jumpClick :
			velocity.y -= jump_force
			jumpClick = true
			jumping = true
	if !Input.is_key_pressed(KEY_SPACE) && !Input.is_joy_button_pressed(0,JOY_BUTTON_B) && !Input.is_key_pressed(KEY_UP) && !Input.is_key_pressed(KEY_W) && !Input.is_action_pressed("jump") && is_on_floor():
		jumpClick = false

func movement_and_animation():
		if Input.is_action_pressed('ui_right') || Input.is_key_pressed(KEY_D):
			velocity.x = speed
			$Sprite2D.flip_h = false
			$CollisionPolygon2D.scale.x = 1
			walking = true

		elif Input.is_action_pressed('ui_left') || Input.is_key_pressed(KEY_A):
			velocity.x = -speed
			$Sprite2D.flip_h = true
			$CollisionPolygon2D.scale.x = -1
			walking = true
		else:
			velocity.x = 0
			walking = false

func setar_animacao():
	var state = "idle"
	
	if jumping:
		state = "jumping"
	elif walking:
		state = 'walking'
		
	if animation.name != state:
		animation.play(state)
