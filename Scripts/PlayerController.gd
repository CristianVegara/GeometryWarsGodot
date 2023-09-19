extends RigidBody2D

const SPEED = 10000
var speed_multiplier = 4
var direction = Vector2.ZERO
var previous_position: Vector2
var projectile_scene: PackedScene


func _ready():
	projectile_scene = preload("res://Prefabs/Projectile.tscn")
	set_previous_position()


func _process(delta):
	# Rotate player
	shoot_in_mouse_direction()
	
	# Input detection and movement
	direction = key_detection()
	player_movement(direction, delta)
	# Rotate sprite to face movement direction
	player_sprite_face_forward()

	set_previous_position()


func key_detection():
	direction = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	
	return direction


func player_movement(direction_direction, delta):
	set_linear_velocity(direction_direction.normalized() * SPEED * delta * speed_multiplier)


func player_sprite_face_forward():
	if previous_position != global_position:
		$Sprite2D.look_at(Tools.vector_direction(previous_position, global_position))


func shoot_in_mouse_direction():
	var targetDirection = get_global_mouse_position()
	$ProjectileSpawn.look_at(targetDirection)


func set_previous_position():
	previous_position = global_position


func _on_timer_timeout():
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var new_instance = projectile_scene.instantiate()
		new_instance.global_position = $ProjectileSpawn/ProjectileSpawnPoint.global_position
		# Sets projectiles as children of root node
		$"..".add_child(new_instance)


func _on_area_2d_body_entered(body):
	print('Player collided with ', body.name)
