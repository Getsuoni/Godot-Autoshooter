extends Area2D

#targets mobs based on distance between player and mob
func _physics_process(_delta):
	var baddies_in_range = get_overlapping_bodies()
	if (baddies_in_range.size() > 0):
		var target_baddie = baddies_in_range.front()
		look_at(target_baddie.global_position)

#loads bullet to be shot at mob from the shooting point
func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


#calls the shoot function based on a set timer between shots
func _on_timer_timeout():
	shoot()
