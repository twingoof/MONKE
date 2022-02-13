extends Node2D

onready var anim = $AnimationPlayer

var banana_skins = 3

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func peel_banana():
	#score +1
	banana_skins -= 1;
	if (banana_skins <= 0):
		anim.play( "End" );

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
