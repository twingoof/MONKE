extends Node2D

var sprite_size = Vector2(0,0)
onready var center = sprite_size / 2

func _ready():
	sprite_size = Vector2(get_node("Sprite").texture.get_height(),get_node("Sprite").texture.get_width())

func _process(delta):
	position = get_global_mouse_position() - (sprite_size)

func _on_KnifeHitbox_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_parent().knife_cutting()
