extends Enemy


func _on_HitBox_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(1)

