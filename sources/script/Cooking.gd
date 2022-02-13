extends Node2D

onready var success = 0
onready var onTime = false

onready var letterSprite = get_node("Letter")
onready var succesRect = get_node("SuccessRect")

var qteA = preload("res://assets/a_key_button_idle.png")
var qteB = preload("res://assets/b_key_button_idle.png")
var qteN = preload("res://assets/n_key_button_idle.png")

var textures = [qteA, qteB, qteN]
var keys = [KEY_A, KEY_B, KEY_N]

var timer
var eventTimer
var random = RandomNumberGenerator.new()
var expectedLetter
var lastLetter

func _ready():
	timer = Timer.new()
	eventTimer = Timer.new()
	
	eventTimer.connect("timeout", self, "_on_eventTimer_timeout")
	timer.connect("timeout", self, "_on_timer_timeout")
	eventTimer.set_wait_time(1)
	timer.set_wait_time(30)
	add_child(eventTimer)
	add_child(timer)
	eventTimer.start()
	timer.start()

	random.randomize()
	getRandomLetterSprite()

	succesRect.visible = false

func _on_timer_timeout():
	get_tree().quit()

func _on_eventTimer_timeout():
	getRandomLetterSprite()

func _input(event):
	if event is InputEventKey:
		if event.pressed && event.scancode == keys[expectedLetter]:
			succesRect.color = Color(0, 1, 0, 0.2)
			succesRect.visible = true
			success += 1
			getRandomLetterSprite()

func getRandomLetterSprite():
	while true:
		expectedLetter = randi() % 3
		if expectedLetter != lastLetter:
			break
	letterSprite.set_texture(textures[expectedLetter])
	eventTimer.stop()
	eventTimer.start()
		
