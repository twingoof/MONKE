extends Node2D


onready var PauseBtn = get_node("PauseBtn")
onready var PauseMenu = get_node("PauseMenu")
onready var QuitBtn = PauseMenu.get_node("QuitBtn")
onready var SoundBtn = PauseMenu.get_node("SoundBtn")
# onready var Music = get_node("..")

func _ready():
	PauseBtn.connect("pressed", self, "_PauseBtn_pressed")
	QuitBtn.connect("pressed", self, "_QuitBtn_pressed")
	SoundBtn.connect("pressed", self, "_SoundBtn_pressed")
	PauseMenu.visible = false

func _PauseBtn_pressed():
	PauseMenu.visible = !PauseMenu.visible
	get_tree().paused = !get_tree().paused

func _QuitBtn_pressed():
	get_tree().quit()

func _SoundBtn_pressed():
	# TODO: Add music handling
	pass
