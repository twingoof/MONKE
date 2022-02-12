extends Area2D

onready var mouse_over = false

func _on_PeelHitbox_mouse_entered():
	mouse_over = true

func _on_PeelHitbox_mouse_exited():
	mouse_over = false

func _on_PeelHitbox_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$AnimationPlayer.play("RightPeeling")
