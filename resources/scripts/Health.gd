extends Resource
class_name Health

export (int) var health = 5

signal health_changed(damage)
signal dead
	

func take_damage(amount):
	health -= amount
	
	if health <= 0:
		emit_signal("dead")
		return
	
	emit_signal("health_changed", amount)
