extends Area2D

export var damage : int = 1

func _on_Hitbox_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(damage)
