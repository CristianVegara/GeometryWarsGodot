extends RigidBody2D

var enemy_size: Vector2 = Vector2(3,3)
var speed: float = 1.0
var target_position: Vector2
var player:Node

func _physics_process(delta):
	var direction = Vector2.ZERO
	find_player()
	chase_player()
	print(player.global_position,target_position)


func find_player():
	if player == null:
		player = get_node("../Player")


func chase_player():
	if player != null:
		target_position = player.global_position
		
	var direction = Tools.vector_direction(global_position, target_position)
	
	# Calculate the velocity by multiplying the direction vector by the speed
	linear_velocity = direction * speed
	print(linear_velocity)
