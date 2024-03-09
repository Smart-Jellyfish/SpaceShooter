extends Node2D

var asteroid_scene: PackedScene = load("res://Scenes/Asteroid/asteroid.tscn")
var laser_scene: PackedScene = load("res://Scenes/Weapons/laser.tscn")
var missile_scene: PackedScene = load("res://Scenes/Weapons/missile.tscn")

var health: int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	initialise_game()

func _process(delta):
	pass
	#$CanvasLayer/PlanetDistance.text = "Planet: " + str(snappedf($DistanceToPlanetTimer.time_left, 0.01))

# Initialises the game.
func initialise_game():
	# Bind the viewport_resized function to the root size_changed event.
	get_tree().get_root().size_changed.connect(viewport_resized)
	
	var viewport = get_viewport_dimensions()

	set_borders(viewport.width, viewport.height)
	set_background(viewport.width, viewport.height, true)
	get_tree().call_group('HUD', 'set_health', health)

# Runs when the viewport is resized to ensure background and borders scale properly
func viewport_resized():
	var viewport = get_viewport_dimensions()
	set_borders(viewport.width, viewport.height)
	set_background(viewport.width, viewport.height, false)
	
# Sets the borders (collision objects) so the player cannot leave the screen.
func set_borders(viewport_width, viewport_height):
	var border_thickness : int = 5
	
	# TOP - 
	# Position = width/2, 0 | length = width | height = 5
	$Borders/TopBorder/CollisionShape2D.position = Vector2(viewport_width / 2 , 0)
	$Borders/TopBorder/CollisionShape2D.shape.size.x = viewport_width + border_thickness
	$Borders/TopBorder/CollisionShape2D.shape.size.y = border_thickness
	
	# BOTTOM
	# Position = width/2, height | length = width | height = 5
	$Borders/BottomBorder/CollisionShape2D.position = Vector2(viewport_width / 2 , viewport_height)
	$Borders/BottomBorder/CollisionShape2D.shape.size.x = viewport_width + border_thickness
	$Borders/BottomBorder/CollisionShape2D.shape.size.y = border_thickness
	
	# LEFT
	# Position = 0, height/2 |  length = 5 | height = height
	$Borders/LeftBorder/CollisionShape2D.position = Vector2(0 , viewport_height / 2)
	$Borders/LeftBorder/CollisionShape2D.shape.size.y = viewport_height + border_thickness
	$Borders/LeftBorder/CollisionShape2D.shape.size.x = border_thickness
	
	# RIGHT
	# Position = wdth, height/2 | length = 5 | height = height
	$Borders/RightBorder/CollisionShape2D.position = Vector2(viewport_width , viewport_height / 2)
	$Borders/RightBorder/CollisionShape2D.shape.size.y = viewport_height + border_thickness
	$Borders/RightBorder/CollisionShape2D.shape.size.x = border_thickness

# Sets the background according to the width / height specified, optionally randomising the image	
func set_background(width, height, randomise):
	if (randomise):
		var background_id = randi_range(0, 24)
		var background_res = "res://Assets/Images/Backgrounds/Nebulas/Nebula_%s.png" % background_id
		var background_image = load(background_res) 
		$Background/Texture.texture = background_image
	
	$Background/Texture.set_size(Vector2(width, height))
	
# Determines the current viewport size and returns a dictionary of width and height.
func get_viewport_dimensions():
	var viewport_dimensions = get_viewport_rect()
	return  { "width": viewport_dimensions.size[0], "height": viewport_dimensions.size[1] }


func _on_player_laser_fired(current_position):
	var laser = laser_scene.instantiate()
	laser.position = current_position
	$Weapons.add_child(laser)

func _on_player_misslile_fired(current_position):
	var missile = missile_scene.instantiate()
	missile.position = current_position
	$Weapons.add_child(missile)


func _on_asteroid_timeout_timeout():
	var asteroid = asteroid_scene.instantiate()
	$Asteroids.add_child(asteroid)

	asteroid.connect('collision_with_player', _on_asteroid_collision_with_player)

func _on_asteroid_collision_with_player():
	print("asteroid collided with player in level")
	
	get_tree().call_group('HUD', 'set_health', health)
	
	health -= 1
	if (health < 0):
		get_tree().change_scene_to_file("res://Scenes/GameOver/game_over.tscn")

func _on_distance_to_planet_timer_timeout():
	$AsteroidTimeout.stop()
	
	# TODO - spawn a planet
	print("planet is here")
