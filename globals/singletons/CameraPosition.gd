extends Camera2D


onready var player_position = get_parent().get_parent().find_node("Player")
onready var tween = $Tween

export var right_border_limit:int = 268
export var bottom_border_limit:int = 166
export var left_border_limit:int = 444
export var length_of_offset:float = 4


func _ready():
	position = _get_position()


func _process(_delta):
	tween.interpolate_property(self, "position", position, _get_position() + _mouse_offset(),0.9,Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()


func _get_position():
	var camera_position_x = clamp(player_position.position.x - 128, -left_border_limit, right_border_limit-256)
	var camera_position_y = clamp(player_position.position.y - 75, -INF, bottom_border_limit-150)
	
	return Vector2(camera_position_x, camera_position_y)

func _mouse_offset():
	return (get_global_mouse_position() - player_position.position).normalized() * length_of_offset
