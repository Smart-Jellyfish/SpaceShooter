extends Control

var level_scene: PackedScene = load("res://Scenes/Level/level.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	$Background/CenterContainer/VBoxContainer/ScoreLabel.text = "Your score was: " + str(Global.score)

func _process(delta):
	if Input.is_action_pressed("Fire Primary"):
		get_tree().change_scene_to_packed(level_scene)


