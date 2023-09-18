extends RigidBody2D

var targetDirection: Vector2
var speed = 600

func _ready():
	# Get mouse position in screen and set it as the target
	targetDirection = get_global_mouse_position()
	look_at(targetDirection)

	# Calculate the direction vector towards the target
	var direction = (targetDirection - position).normalized()

	# Calculate the velocity by multiplying the direction vector by the speed
	linear_velocity = direction * speed

func _on_body_entered():
	queue_free()

func _on_timer_timeout():
	queue_free()
