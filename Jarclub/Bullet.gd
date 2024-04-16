extends Area2D
# Defines the Bullet, setting its distance to a 0
var bullet_distance = 0


func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta 
	
	bullet_distance += SPEED * delta   
	#when the bullets distance is past the defined range it despawns
	if (bullet_distance > RANGE ):
		queue_free()

	 #when it hits a body it despawns and calls the take_damage method
func _on_body_entered(body):
	queue_free()
	if (body.has_method("take_damage")):
		body.take_damage()
