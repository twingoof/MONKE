extends Area2D

onready var mouse_over = false
var parent_node

func _on_ObjectHitbox_mouse_entered():
	mouse_over = true

func _on_ObjectHitbox_mouse_exited():
	mouse_over = false

func _on_ObjectHitbox_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$AnimationPlayer.play("Fell")
		parent_node = get_parent().get_parent().get_parent().grab_banana()

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	pass # Replace with function body.
