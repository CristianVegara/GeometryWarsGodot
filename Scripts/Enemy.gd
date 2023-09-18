extends RigidBody2D

var speed: float = 300.0
var stoppingDistance: float = 35
var targetDirection: Vector2

func _ready():
	pass

func _physics_process(delta):
	var direction = Vector2.ZERO

	targetDirection = get_global_mouse_position()

	if position.distance_to(targetDirection) > stoppingDistance:
		look_at(targetDirection)

		# Calculate the direction vector towards the target
		direction = (targetDirection - position).normalized()

	# Calculate the velocity by multiplying the direction vector by the speed
	linear_velocity = direction * speed
