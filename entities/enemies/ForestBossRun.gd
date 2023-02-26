extends State

var in_range:bool = false



func _process(_delta):
	if is_instance_valid(player) and in_range:
		if (owner.position - player.position).length() > 16 and owner.health.health > 0:
			set_state(state_name)


func _on_PlayerDetector_entered():
	in_range = true
