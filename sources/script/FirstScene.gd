extends Node2D

var n = 5
var banana = load("res://sources/objects/banana.tscn")
var scooter = load("res://sources/objects/scooter.tscn")
var chair = load("res://sources/objects/chair.tscn")
var objects = [scooter,chair]

onready var anim = $Animation

var bananas_nbr = 5
var titleId

func _ready():
	anim.play( "Init" )

func grab_banana():
	#score +1
	bananas_nbr -= 1;
	if (bananas_nbr <= 0):
		anim.play( "End" );

func spawn():
	randomize()

	for i in n:
		var id = randi()%2
		var x = rand_range(500,1250)
		var y = rand_range(0,500)
		var rand_pos = Vector2(x,y)

		var object_instance = objects[id].instance()
		object_instance.position = rand_pos
		object_instance.rotation = rand_range(0,360)
		add_child(object_instance)
	for i in n:
		var x = rand_range(500,1250)
		var y = rand_range(0,500)
		var rand_pos = Vector2(x,y)
		
		var banana_instance = banana.instance()
		var rotation = rand_range(0,360)
		banana_instance.position = rand_pos
		banana_instance.get_node("Container").get_node("Sprite").rotation = rotation
		banana_instance.get_node("Container").get_node("ObjectHitbox").rotation = rotation
		add_child(banana_instance)
