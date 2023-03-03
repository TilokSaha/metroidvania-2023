extends Enemy

onready var hit_sound_fx = $HitSoundFX
signal dead


func _ready():
	set_physics_process(false)

func _on_HitBox_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(1)
		hit_sound_fx.play()

func _on_death():
	emit_signal("dead")
