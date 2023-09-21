extends CharacterBody2D

var dir = -1;
var grav = 10; 
var speed = 100;

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("walking")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $RayCastRight.is_colliding():
		dir = -1; 
		
	elif $RayCastLeft.is_colliding():
		dir = 1; 
		
	if !$RayCastFloorLeft.is_colliding():
		dir = -1; 
	elif !$RayCastFloorRight.is_colliding() || $RayCastLeft.is_colliding() :
		dir = 1; 
		
	if dir == -1:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	if !is_on_floor():
		velocity.y += grav;
		
	velocity.x = speed * dir
	move_and_slide()
