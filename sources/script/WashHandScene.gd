extends Node2D

func _ready():
	$AnimationPlayerSprites.play("init")
	$AnimationPlayerMusic.play("init")


func _check_no_stains_left(name):
	var stains = get_node(name + "/GorillaSprite").get_children()
	var count = 0
	
	for stain in stains:
		if stain.visible:
			count += 1
	return count


func _process(_delta):
	var count = self._check_no_stains_left("right_foot")
	count += self._check_no_stains_left("left_foot")
	count += self._check_no_stains_left("right_hand")
	count += self._check_no_stains_left("left_hand")
	if count == 0:
		$AnimationPlayerSprites.play("end")
		$AnimationPlayerMusic.play("end")


func _on_NextSceneButton_button_up():
	if (get_tree().change_scene("res://sources/scenes/Peeling.tscn")):
		print("Error loading scene")


func _on_NextSceneButton_pressed():
	$AnimationPlayerSprites/NextSceneButton/ButtonSound.play()


func _on_QuitButton_button_up():
	get_tree().quit()


func _on_QuitButton_pressed():
	$AnimationPlayerSprites/QuitButton/ButtonSound.play()
