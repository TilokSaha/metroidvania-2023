extends State


func _process(_delta):
	if owner.health.health <= 0:
		owner.set_physics_process(false)
		set_state(state_name)
