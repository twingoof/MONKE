extends KinematicBody2D

var dragging = false
var countdown = 3
var hide_stain1 = false
var hide_stain2 = false
var hide_stain3 = false

signal dragsignal;
signal undragsignal;

func _ready():
	connect("dragsignal", self, "_drag_")
	connect("undragsignal", self, "_undrag_")


func _handle_washing(delta):
	var overlapped = get_node('../waterfall').get_overlapping_bodies()
	if overlapped.size() != 0:
		for overlappe in overlapped:
			if overlappe.name == self.name:
				if !hide_stain1 and countdown < 2:
					var sprite = overlappe.get_child(0).get_child(0)
					if sprite != null:
						sprite.hide()
					hide_stain1 = true
				elif !hide_stain2 and countdown < 1:
					var sprite = overlappe.get_child(0).get_child(1)
					if sprite != null:
						sprite.hide()
					hide_stain2 = true
				elif !hide_stain3 and countdown == 0:
					var sprite = overlappe.get_child(0).get_child(2)
					if sprite != null:
						sprite.hide()
					hide_stain3 = true
				else:
					countdown -= delta
					if countdown <= 0:
						countdown = 0


func _handle_dragging():
	var mousepos = get_viewport().get_mouse_position()
	var offset = 0

	self.position = Vector2(mousepos.x, mousepos.y)
	if self.name.find('foot') == -1:
		offset = 300
	else:
		offset = 500
	if self.position.y <= offset:
		self.position.y = offset


func _process(delta):
	if dragging:
		self._handle_washing(delta)
		self._handle_dragging()


func _on_KinematicBody2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if dragging == false:
				emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("undragsignal")


func _undrag_():
	dragging = false


func _drag_():
	dragging = true
