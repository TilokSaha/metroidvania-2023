extends Character
class_name Enemy

onready var _agent = $NavigationAgent2D
onready var player = get_parent().find_node("Player")

func _ready():
	_update_player_location()

func _find_direction():
	physics.direction = position.direction_to(_agent.get_next_location()).normalized()
	_update_player_location()
	
func _update_player_location():
	_agent.set_target_location(player.position)
