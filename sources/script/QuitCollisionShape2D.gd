extends CollisionShape2D

func _on_Area2D_entered():
	get_parent().get_parent().get_node("Sprites").get_node("Idle").z_index = -1
	get_parent().get_parent().get_node("Sprites").get_node("Pressed").z_index = 1
	
func mouse_exited():
	get_parent().get_parent().get_node("Sprites").get_node("Idle").z_index = 1
	get_parent().get_parent().get_node("Sprites").get_node("Pressed").z_index = -1
