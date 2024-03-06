extends CharacterBody2D
#
signal laser_fired(current_position)
signal misslile_fired(current_position)
# Player Health
#	> 81% = Main Ship - Base - Full health.png
# 	< 80% = Main Ship - Base Slight damage.png
#	< 60% = Main Ship - Base Damaged.png
#	< 20% = Main Ship - Base - Very Damaged

const SPEED :float = 400.0

func _process(_delta):
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
	move_and_slide()

func _input(event):
	if event.is_action_pressed("Fire Primary"):
		laser_fired.emit(position)
	elif event.is_action_pressed("Fire Secondary"):
		misslile_fired.emit(position)
