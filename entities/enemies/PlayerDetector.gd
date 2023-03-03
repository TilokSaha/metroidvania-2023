extends Area2D


signal entered 
onready var boss_music = $"../BossMusic"


func _on_PlayerDetector_body_entered(_body):
	owner.set_physics_process(true)
	emit_signal("entered")
	boss_music.play()
