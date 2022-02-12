extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_SoundOffButton_button_up():
	get_node("../../../../Music/GameMusic").play()
	get_parent().visible = false
	get_parent().get_parent().get_node("SoundOn").visible = true
