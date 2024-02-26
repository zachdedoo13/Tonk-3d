extends CharacterBody3D

@export var round : PackedScene
var can_shoot = true

func _process(delta):
	rotation.y += deg_to_rad(0.5)
	var contact = $RayUtils.look_at_rotation()
	if contact:
		var check = $RayUtils.get_collider().is_in_group("player")
		if check:
			shoot()
	
func shoot():
	if can_shoot:
		can_shoot = false
		$Timer.start()
		var bullet = round.instantiate()
		owner.add_child(bullet)
		bullet.rotation.y = rotation.y
		bullet.global_position = global_position
		print("shoot")


func _on_timer_timeout():
	can_shoot = true
