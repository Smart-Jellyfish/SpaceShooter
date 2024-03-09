extends Area2D

@export var speed = 500

func _ready():
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.1).from(Vector2(0,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta


#func _on_body_entered(body):
#	print("Laser hit a " + str(body))


func _on_body_entered(body):
	print("Laser hit a " + str(body))

