extends Camera2D


onready var player_position = get_parent().get_parent().find_node("Player")


func _process(_delta):
	position = _get_position()


func _get_position():
	var camera_position_x = clamp(player_position.position.x - 128, -INF, 272-256)
	var camera_position_y = clamp(player_position.position.y - 75, -INF, 166-150)
	
	return Vector2(camera_position_x, camera_position_y)
