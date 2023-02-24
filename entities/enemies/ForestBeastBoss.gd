extends Enemy


func _on_HitBox_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(1)

func _on_death():
	pass
