extends FiniteStateMachine
class_name State


onready var animation_player = owner.find_node("AnimationPlayer")
export (String) var state_name = ""


func _process(_delta):
	_check_transition()
	

func _check_transition():
	pass


func enter_state(new_state):
	animation_player.play(new_state)
