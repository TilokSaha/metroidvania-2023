extends State


func _process(_delta):
	if is_instance_valid(player):
		if (owner.position - player.position).length() < 16 and owner.health.health > 0:
			set_state(state_name)
