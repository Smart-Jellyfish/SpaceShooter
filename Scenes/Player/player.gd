extends CharacterBody2D
#
#

# Player Health
#	100% = Main Ship - Base - Full health.png
#	
#	< 20% = Main Ship - Base - Very Damaged

const SPEED = 500.0
#const JUMP_VELOCITY = -400.0

func _process(delta):
	pass

func _input(event):	
	if event.is_action("Left") or event.is_action("Right") or event.is_action("Up") or event.is_action("Down"):
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * SPEED
		move_and_slide()
	elif event.is_action_pressed("Fire Primary"):
		print("Firing primary")
	elif event.is_action_pressed("Fire Secondary"):
		print("Firing secondary")
