extends RigidBody2D


var target_direction: Vector2
var speed = 1200
var enemy: Node
var relative_speed: Vector2

func _ready():
	# Calculates the direction in which bullets will look at taking the opposite direction from spawn to center
	var b_pos = $".."/Player/ProjectileSpawn/ProjectileSpawnPoint.global_position
	var a_pos = $".."/Player/ProjectileSpawn.global_position
	target_direction = Tools.vector_direction(a_pos, b_pos)
	look_at(target_direction)

	# Calculate the direction vector towards the target
	var direction = (target_direction - position).normalized()

	# Calculate the velocity by multiplying the direction vector by the speed
	linear_velocity = (direction * speed) + relative_speed


# Despawns bullet after some time in case it hasn't collided with anything
func _on_timer_timeout():
	queue_free()
