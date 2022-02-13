extends Node2D

var stateId = 0
onready var firstCollision = get_node("CuttingLines/First/FirstCollision")
onready var secondCollision = get_node("CuttingLines/Second/SecondCollision")
onready var thirdCollision = get_node("CuttingLines/Third/ThirdCollision")
onready var firstLine = get_node("CuttingLines/First")
onready var secondLine = get_node("CuttingLines/Second")
onready var thirdLine = get_node("CuttingLines/Third")
onready var collisions = [firstCollision,secondCollision,thirdCollision]
onready var lines = [firstLine,secondLine,thirdLine]

onready var anim = $Animation

func init_lines():
	for i in range(0, len(lines)):
		if(i == 0):
			lines[i].visible = true
		else:
			lines[i].visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play( "Init" )

func play_game_music():
	$Music/GameMusic.play()

func knife_cutting():
	if (get_node("Knife/KnifeHitbox") in collisions[stateId].get_overlapping_areas()):
		stateId += 1
		get_node("Bananas/AnimatedSprite").set_frame(stateId)
		$Music/BananaCutting.play()
		for i in range(0, len(lines)):
			if(i == stateId):
				lines[i].visible = true
			else:
				lines[i].visible = false
	if (stateId == 3):
		anim.play( "End" )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
