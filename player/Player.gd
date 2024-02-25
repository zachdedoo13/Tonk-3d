extends CharacterBody3D

@export var speed = 5
@export var round : PackedScene


func _physics_process(delta):
	
	#movement
	var direction = Input.get_vector("left", "right", "up", "down")
	var move = direction * speed * delta
	position += Vector3(move.x, 0, move.y)
	move_and_slide()
	
	#shooting
	if Input.is_action_just_pressed("shoot"):
		var bullet = round.instantiate()
		owner.add_child(bullet)
		bullet.rotation.y = rotation.y
		bullet.global_position = global_position
		print("shoot")

