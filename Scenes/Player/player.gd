extends CharacterBody2D
#
#

# Player Health
#	100% = Main Ship - Base - Full health.png
#	
#	< 20% = Main Ship - Base - Very Damaged

const SPEED = 400.0

func _process(delta):
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
	move_and_slide()

#	var action_key = Input.ge


func _input(event):
	if event.is_action_pressed("Fire Primary"):
		print("Firing primary")
	elif event.is_action_pressed("Fire Secondary"):
		print("Firing secondary")
