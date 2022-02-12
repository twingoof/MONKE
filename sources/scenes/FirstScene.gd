extends Node2D

var n = 5
var scooter = load("res://sources/objects/scooter.tscn")
var banana = load("res://sources/objects/banana.tscn")
var chair = load("res://sources/objects/chair.tscn")
var objects = [scooter, chair]

onready var anim = $InitAnimation

func _ready():
	anim.play( "Init" )

func spawn():
	randomize()
	for i in n:
		var id = rand_range(0,2)
		var x = rand_range(500,1250)
		var y = rand_range(0,500)
		var rand_pos = Vector2(x,y)

		var object_instance = objects[id].instance()
		object_instance.position = rand_pos
		object_instance.rotation = rand_range(0,360)
		add_child(object_instance)
	for i in 5:
		var x = rand_range(500,1250)
		var y = rand_range(0,500)
		var rand_pos = Vector2(x,y)

		var object_instance = banana.instance()
		object_instance.position = rand_pos
		object_instance.rotation = rand_range(0,360)
		add_child(object_instance)
