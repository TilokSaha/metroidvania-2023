extends Resource
class_name Physics

export (float, 0, 1000) var max_speed 
export (float, 0, 1000) var accelaration 
export (float, 0, 1) var coefficient_of_friction 

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func accelarate():
	velocity += direction * accelaration
	velocity = velocity.limit_length(max_speed)
	
	
func friction():
	velocity = lerp(velocity, Vector2.ZERO, coefficient_of_friction)
