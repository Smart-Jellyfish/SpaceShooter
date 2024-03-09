extends Area2D

@export var speed = 200
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta


func _on_body_entered(body):
	print(body + " was struck by a missile")
