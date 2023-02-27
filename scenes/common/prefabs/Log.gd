extends StaticBody2D


var boss_defeated:bool = false


func _on_ForestBeastBoss_dead():
	boss_defeated = true
	get_node("Aura").emitting = true
	
func hurt(_damage):
	if boss_defeated:
		queue_free()

