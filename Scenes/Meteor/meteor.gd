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
	
	# Set a random velocity
	VELOCITY = randf_range(1, 10)
	
	# Set random start position
	var width  = get_viewport().get_visible_rect().size[0]
	var random_x = randi_range(0, width)
	var random_y = randi_range(-150, 50)
	position = Vector2(random_x, random_y)

func _process(delta):
		position += Vector2(0, 1.0) * 400 * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if ROTATE_CLOCKWISE:
		rotation += 1 * ROTATION_SPEED * delta
	else:
		rotation += -1 * ROTATION_SPEED * delta
		
	move_and_slide()
