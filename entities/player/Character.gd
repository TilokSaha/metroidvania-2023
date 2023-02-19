extends KinematicBody2D
class_name Character


export (Resource) var physics = null
export (Resource) var health = null


func _ready():
	pass


func _physics_process(_delta):
	_find_direction()
	_motion()
	

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
