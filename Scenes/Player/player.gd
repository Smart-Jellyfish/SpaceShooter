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

var laser_ready :bool = true
var missile_ready :bool = true

func _process(_delta):
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
	move_and_slide()

func _input(event):
	if event.is_action_pressed("Fire Primary") and laser_ready:
		laser_fired.emit($WeaponStartPosition.global_position)
		$LaserCooldownTimer.start()
		laser_ready = false
	elif event.is_action_pressed("Fire Secondary") and missile_ready:
		misslile_fired.emit($WeaponStartPosition.global_position)
		$MissileCooldownTimer.start()
		missile_ready = false

func _on_missile_cooldown_timer_timeout():
	missile_ready = true

func _on_laser_cooldown_timer_timeout():
	laser_ready = true
