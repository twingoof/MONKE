extends Node2D

onready var anim = $AnimationPlayer

var banana_skins = 3

func peel_banana():
	#score +1
	banana_skins -= 1;
	$Music/BananaPeeling.play()
	if (banana_skins <= 0):
		anim.play( "End" );

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play( "Init" )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NextSceneButton_button_up():
	if (get_tree().change_scene("res://sources/scenes/CuttingScene.tscn")):
		print("Error loading scene")

func _on_NextSceneButton_pressed():
	$Buttons/NextSceneButton/ButtonSound.play()
