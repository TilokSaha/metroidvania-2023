extends Area2D


signal entered 


func _on_PlayerDetector_body_entered(body):
	owner.set_physics_process(true)
	emit_signal("entered")
