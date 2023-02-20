extends Character


func _flip():
	var facing = get_global_mouse_position() - position
	if facing.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
