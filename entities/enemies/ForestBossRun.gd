extends State


func _process(_delta):
	if (owner.position - player.position).length() > 16:
		set_state(state_name)
