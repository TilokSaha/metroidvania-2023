extends Node2D


onready var camera = $Camera2D
onready var noise = OpenSimplexNoise.new()

var SHAKE_STRENGTH: float = 0.0
var DECAY_RATE: float = 3.0 
var noise_i = 0.0
var NOISE_SPEED = 15.0


func _ready():
	randomize()
	noise.seed = randi()
	noise.period = 4
	noise.octaves = 8


func _input(event):
	if event.is_action_pressed("shake"):
		apply_shake()
	

func apply_shake(amplitude := 20.0):
	SHAKE_STRENGTH += amplitude
	set_process(true)

func _process(delta):
	SHAKE_STRENGTH = lerp(SHAKE_STRENGTH, 0, DECAY_RATE * delta)
	
	camera.offset = Vector2(128,75) +  _get_noise_offset(delta)
	if SHAKE_STRENGTH == 0:
		set_process(false) 


func _get_noise_offset(delta):
	noise_i += delta * NOISE_SPEED
	return Vector2( 
					noise.get_noise_2d(noise.seed, noise_i) * SHAKE_STRENGTH,
					noise.get_noise_2d(noise.seed * 2, noise_i) * SHAKE_STRENGTH
					 )
