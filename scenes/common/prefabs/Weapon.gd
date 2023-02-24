extends Node2D
class_name Weapon

onready var animation_player = $AnimationPlayer
onready var parent = get_parent()

func _input(event):
	if event.is_action_pressed("attack") and not animation_player.is_playing():
		animation_player.play("Attack")

func _process(_delta):
	rotation_degrees = rad2deg((get_global_mouse_position() - parent.position).angle())

func start_process():
	set_process(true)


func stop_process():
	set_process(false)
