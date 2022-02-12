extends Node2D

var is_playing = true
var seek_time = 0.0

func _ready():
	$GameMusic.play()
