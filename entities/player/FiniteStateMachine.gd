extends Node2D
class_name FiniteStateMachine


var state = null
var previous_state = null


func _process(_delta):
	pass

func set_state(new_state):
	
	previous_state = state
	state = new_state

	exit_state(previous_state)
	enter_state(new_state)


func exit_state(_previous_state):
	pass
	

func enter_state(_new_state):
	pass
