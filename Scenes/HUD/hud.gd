extends CanvasLayer

static var texture = load("res://Assets/Images/Ship/life.png")

func _process(delta):
	$MarginContainer/Score.text = "Score: " + str(Global.score)

func set_health(health):
	# remove all children from the LifeContainer
	for child in $MarginContainer2/LifeContainer.get_children():
		child.queue_free()
	
	for i in health: 
		var text_rec = TextureRect.new()
		text_rec.texture = texture
		text_rec.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/LifeContainer.add_child(text_rec)
	
	
