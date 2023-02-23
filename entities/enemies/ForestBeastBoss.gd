extends Enemy


func _on_HitBox_body_entered(body):
	body.hurt(1)


