extends State


func _check_transition():
	if Util.vector_direction() == Vector2.ZERO:
		set_state(state_name)
