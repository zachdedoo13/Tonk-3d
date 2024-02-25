extends CharacterBody3D


@export var speed : int
var first = true
@export var max_collisions : int
var collision_count = -1

var test = Vector2(0, 0)

var vel = 0

func _physics_process(delta):
	if first:
		vel = Vector2.from_angle(rotation.y - deg_to_rad(180)) * speed
		velocity.z = vel.x
		velocity.x = vel.y
		first = false
	else:
		var collision = move_and_collide(velocity * delta)
		if collision:
			if collision.get_collider().is_in_group("mobs"):
				collision.get_collider().queue_free()
			collision_count += 1
			if collision_count >= max_collisions:
				queue_free()
			if collision_count >= 0:
				set_collision_layer_value(3, true)
				set_collision_mask_value(3, true)
			velocity = velocity.bounce(collision.get_normal())
			test.x = velocity.z
			test.y = velocity.x
			rotation.y = test.angle()
