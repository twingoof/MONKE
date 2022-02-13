extends Node2D

func _ready():
	$AnimationPlayer.play("init")


func _on_NextSceneButton_button_up():
	if (get_tree().change_scene("res://sources/scenes/JarringScene.tscn")):
		print("Error loading scene")


func _on_NextSceneButton_pressed():
	$AnimationPlayer/NextSceneButton/ButtonSound.play()
