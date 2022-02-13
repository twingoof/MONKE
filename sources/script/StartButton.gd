extends TextureButton

func _ready():
	pass

func _on_StartButton_pressed():
	$ButtonSound.play()

func _on_StartButton_button_up():
	if (get_tree().change_scene("res://sources/scenes/WashHandScene.tscn")):
		print("Error loading scene")
