extends Resource
class_name Health

export (int) var max_health = 4
var current_health: int 

signal health_changed(damage)
signal dead

func _init():
	current_health =  max_health
	

func take_damage(amount):
	current_health -= amount
	
	if current_health <= 0:
		emit_signal("dead")
		return
	
	emit_signal("health_changed", amount)
