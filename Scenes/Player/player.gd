extends CharacterBody2D
#
#

# Player Health
#	> 81% = Main Ship - Base - Full health.png
# 	< 80% = Main Ship - Base Slight damage.png
#	< 60% = Main Ship - Base Damaged.png
#	< 20% = Main Ship - Base - Very Damaged

const SPEED :float = 400.0

func _process(delta):
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
	move_and_slide()

func _input(event):
	if event.is_action_pressed("Fire Primary"):
		print("Firing primary")
	elif event.is_action_pressed("Fire Secondary"):
		print("Firing secondary")
