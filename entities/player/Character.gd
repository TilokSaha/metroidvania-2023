extends KinematicBody2D
class_name Character


export (Resource) var physics = null
export (Resource) var health = null

onready var sprite = $AnimatedSprite


func _ready():
	pass


func _physics_process(_delta):
	_find_direction()
	_motion()
	_flip()
	

func _find_direction():
	physics.direction.x = Util.horizontal_direction()
	physics.direction.y = Util.vertical_direction()
	
	physics.direction = physics.direction.normalized()
	
	
func _motion():
	physics.accelarate()
	physics.velocity = move_and_slide(physics.velocity)
	physics.friction()


func _on_death():
	queue_free()


func _flip():
	var facing = get_global_mouse_position() - position
	if facing.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
