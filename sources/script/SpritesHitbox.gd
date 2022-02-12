extends Area2D

onready var sprites = get_parent().get_node("Sprites")
onready var state = 1
onready var mouse_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	sprites.get_node("BowlStateOne").visible = true
	sprites.get_node("BowlStateTwo").visible = false
	sprites.get_node("BowlStateThree").visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpritesHitbox_mouse_exited():
	mouse_over = false


func _on_SpritesHitbox_mouse_entered():
	mouse_over = true

func _on_SpritesHitbox_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		if state == 1:
			sprites.get_node("BowlStateOne").visible = false
			sprites.get_node("BowlStateTwo").visible = true
			state = 2
		elif state == 2:
			sprites.get_node("BowlStateTwo").visible = false
			sprites.get_node("BowlStateThree").visible = true
			state = 3
		
