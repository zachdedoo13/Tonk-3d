extends RayCast3D


func look_at_rotation():
	target_position = $Marker3D.position * 10000
	target_position.y = $Marker3D.position.y
	if is_colliding():
		$contact.visible = true
		$contact.global_position = get_collision_point()
		return true
	else:
		$contact.visible = false
		return false
