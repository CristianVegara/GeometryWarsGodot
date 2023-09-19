extends RigidBody2D

const SPEED = 500
var move = Vector2.ZERO
var targetDirection: Vector2

var projectile_spawn_point: Vector2
var projectileScene: PackedScene


func _ready():
	projectileScene = preload("res://Prefabs/Projectile.tscn")


func _process(delta):
	# Rotate player
	face_mouse_direction()
	
	# Input detection and movement
	move = key_detection()
	player_movement(move, delta)


func key_detection():
	move = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_W):
		move.y -= 1
	if Input.is_key_pressed(KEY_S):
		move.y += 1
	if Input.is_key_pressed(KEY_A):
		move.x -= 1
	if Input.is_key_pressed(KEY_D):
		move.x += 1
	
	return move


func player_movement(move_direction, delta):
	global_position += move_direction.normalized() * SPEED * delta


func face_mouse_direction():
	targetDirection = get_global_mouse_position()
	look_at(targetDirection)


func _on_timer_timeout():
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var newInstance = projectileScene.instantiate()
		newInstance.global_position = $ProjectileSpawnPoint.global_position
		get_parent().add_child(newInstance)


func _on_body_entered(_area):
	print('player collided')
	pass
