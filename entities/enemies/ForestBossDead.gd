extends State


func _process(_delta):
	if owner.health.health == 0:
		set_state(state_name)
