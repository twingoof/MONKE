extends Node2D


var sprite_size = Vector2(0,0)
onready var center = sprite_size / 2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	sprite_size = Vector2(get_node("Cursor").texture.get_height() - 450,get_node("Cursor").texture.get_width() + 290)

func _process(delta):
	position = get_global_mouse_position() - (sprite_size)
