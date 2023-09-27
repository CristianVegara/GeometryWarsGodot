extends RigidBody2D

var target_direction: Vector2
var speed = 700
var enemy: Node

func _ready():
	# Calculates the direction in which bullets will look at taking the opposite direction from spawn to center
	var b_pos = $".."/Player/ProjectileSpawn/ProjectileSpawnPoint.global_position
	var a_pos = $".."/Player/ProjectileSpawn.global_position
	target_direction = Tools.vector_direction(a_pos, b_pos)
	look_at(target_direction)

	# Calculate the direction vector towards the target
	var direction = (target_direction - position).normalized()

	# Calculate the velocity by multiplying the direction vector by the speed
	linear_velocity = direction * speed


# Despawns bullet after some time in case it hasn't collided with anything
func _on_timer_timeout():
	queue_free()


# Despawns bullet after it has collided with anything
func _on_area_2d_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if _body.is_in_group("enemie"):
		_body.queue_free()
