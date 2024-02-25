extends CharacterBody3D

@export var speed = 5
@export var chamber_capacity : int
@export var round : PackedScene

var chamber : int = 0

func _ready():
	chamber = chamber_capacity

func _physics_process(delta):
	#raycast
	$RayUtils.look_at_rotation()
	#movement
	var direction = Input.get_vector("left", "right", "up", "down")
	var move = direction * speed * delta
	position += Vector3(move.x, 0, move.y)
	move_and_slide()
	
	#shooting
	if Input.is_action_just_pressed("shoot"):
		print(chamber)
		if not chamber <= 0:
			shoot()
			chamber -= 1

func shoot():
	var bullet = round.instantiate()
	owner.add_child(bullet)
	bullet.rotation.y = rotation.y
	bullet.global_position = global_position
	print("shoot")


func _on_timer_timeout():
	if chamber < chamber_capacity:
		chamber += 1
		print("added " + str(chamber))
