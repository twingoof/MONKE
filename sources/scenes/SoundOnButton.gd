extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().visible = true

func _on_SoundOnButton_button_up():
	get_node("../../../../Music/GameMusic").stop()
	get_parent().visible = false
	get_parent().get_parent().get_node("SoundOff").visible = true
