extends Node2D


func _process(_delta):
	if owner.health.health <= 10:
		owner.find_node("Aura").emitting = true
		set_process(false)
