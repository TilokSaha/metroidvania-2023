extends Area2D

export var damage : int = 1
onready var hit_sound_fx = $HitSoundFX
export var stream: Resource = null

func _ready():
	hit_sound_fx.stream = stream

func _on_Hitbox_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(damage)
		hit_sound_fx.play()
