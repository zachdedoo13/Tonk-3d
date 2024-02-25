extends CharacterBody3D

@export var round : PackedScene

func _process(delta):
	rotation.y += deg_to_rad(0.5)
	var contact = $RayUtils.look_at_rotation()
	if contact:
		var check = $RayUtils.get_collider().is_in_group("player")
		if check:
			shoot()
	
func shoot():
	var bullet = round.instantiate()
	owner.add_child(bullet)
	bullet.rotation.y = rotation.y
	bullet.global_position = global_position
	print("shoot")
