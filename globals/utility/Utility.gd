extends Reference
class_name Util


static func horizontal_direction():
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")


static func vertical_direction():
	return Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")


static func pressed_once(action):
	return Input.is_action_just_pressed(action)


static func vector_direction():
	return Vector2(horizontal_direction(),vertical_direction())
