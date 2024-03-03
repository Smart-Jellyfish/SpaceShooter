extends CharacterBody2D

var ROTATION_SPEED: float
var ROTATE_CLOCKWISE: bool
var VELOCITY: float

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set random rotation speed
	ROTATION_SPEED = randf_range(0.0000000000001, 5.0)
	
	# Set ramdom direction
	ROTATE_CLOCKWISE = randi_range(0, 100) % 2 == 1 
	
	# Set ramdom sprite
	VELOCITY = randf_range(1, 10)
	
	# Set random start position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if ROTATE_CLOCKWISE:
		rotation += 1 * ROTATION_SPEED * delta
	else:
		rotation += -1 * ROTATION_SPEED * delta
		
	move_and_slide()
