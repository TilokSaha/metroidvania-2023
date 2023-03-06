extends KinematicBody2D
class_name Character


export (Resource) var physics = null
export (Resource) var health = null
signal health_changed(damage)

onready var sprite = $AnimatedSprite
onready var effect = $Effect
onready var camera = get_parent().find_node("camera_settings")


func _ready():
	physics = physics.duplicate()
	health = health.duplicate()
	health.connect("health_changed", self, "_on_health_changed")
	health.connect("dead", self, "_on_death")


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

func hurt(amount):
	health.take_damage(amount)


func _on_health_changed(damage):
	effect.play("Hit_Effect")
	camera.apply_shake(10)
	emit_signal("health_changed", damage)


func _on_death():
	queue_free()


func _flip():
	pass
