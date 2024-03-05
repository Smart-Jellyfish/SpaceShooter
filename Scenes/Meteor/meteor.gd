extends Area2D

var rotation_speed: float
var rotate_clockwise: bool
var velocity: float
var direction_x: float

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set random rotation speed
	rotation_speed = randf_range(0.0000000000001, 5.0)
	
	# Set ramdom direction
	rotate_clockwise = randi_range(0, 100) % 2 == 1 
	
	# Set a random velocity
	velocity = randf_range(200, 500)
	
	direction_x = randf_range(-1, 1)
	
	# Set random start position
	var width  = get_viewport().get_visible_rect().size[0]
	var random_x = randi_range(0, width)
	var random_y = randi_range(-150, 50)
	position = Vector2(random_x, random_y)

func _process(delta):
		position += Vector2(direction_x, 1.0) * velocity * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if rotate_clockwise:
		rotation += 1 * rotation_speed * delta
	else:
		rotation += -1 * rotation_speed * delta
