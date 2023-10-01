extends RigidBody2D


const SPEED = 43
var speed_scale = 1000
var shockwave_uses = 3

var projectile_scene: PackedScene
var shockwave_component: PackedScene

var direction = Vector2.ZERO
var previous_position: Vector2
var player_immunity: bool = true


func _ready():
	projectile_scene = preload("res://Scenes/Bullet_1.tscn")
	shockwave_component = preload("res://Scenes/Components/Shockwave.tscn")
	set_previous_position()


func _process(delta):
	# Rotate player
	shockwave_key_input_detection()
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
	set_linear_velocity((direction_direction.normalized() * SPEED * delta) * speed_scale) 


func player_sprite_face_forward():
	if previous_position != global_position:
		$PlayerSprite.look_at(Tools.vector_direction(previous_position, global_position))


func shoot_in_mouse_direction():
	var targetDirection = get_global_mouse_position()
	$ProjectileSpawn.look_at(targetDirection)


func shockwave_key_input_detection():
	if Input.is_action_just_pressed("shockwave") and shockwave_uses > 0:
		shockwave_uses -= 1
		var new_instance = shockwave_component.instantiate()
		new_instance.global_position = global_position
		$"../PlayerSpawnedProjectiles".add_child(new_instance)


func set_previous_position():
	previous_position = global_position


func _on_area_2d_body_entered(body):
	if player_immunity:
		return
	# Kills player on collision with enemy
	if body.is_in_group("enemies"):
		$"..".player_lifes -= 1
		queue_free()


func _on_shooting_timer_timeout():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return
		
	var new_instance = projectile_scene.instantiate()
	new_instance.relative_speed = linear_velocity
	new_instance.global_position = $ProjectileSpawn/ProjectileSpawnPoint.global_position
	# Sets projectiles as children of root node
	$"..".add_child(new_instance) # TODO: $"../PlayerSpawnedProjectiles", make sure projectiles functionality is not broken


func _on_spawn_immunity_timer_timeout():
	player_immunity = false
	$PlayerSprite/ImmunitySprite.hide()
