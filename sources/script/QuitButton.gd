extends TextureButton

func _ready():
	pass

func _on_QuitButton_button_up():
	get_tree().quit()


func _on_QuitButton_pressed():
	$ButtonSound.play()
