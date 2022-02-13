extends Area2D

onready var mouse_over = false

func _on_PeelHitbox_mouse_entered():
	mouse_over = true

func _on_PeelHitbox_mouse_exited():
	mouse_over = false

func _on_PeelHitbox_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$AnimationPlayer.play("RightPeeling")
		get_parent().get_parent().get_parent().peel_banana()
