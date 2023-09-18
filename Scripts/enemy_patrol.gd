extends CharacterBody2D

var dir = -1;
var grav = 10;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !$RayCastFloorLeft.is_colliding() || $RayCastRight.is_colliding():
		dir = -1; 
		$Sprite2D.flip_h = false
	
	if !$RayCastFloorRight.is_colliding() || $RayCastLeft.is_colliding() :
		dir = 1; 
		$Sprite2D.flip_h = true
	
	if !is_on_floor():
		velocity.y += grav;
		
	velocity.x = 50 * dir
	move_and_slide()
	pass
