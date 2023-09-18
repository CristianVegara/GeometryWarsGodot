extends RigidBody2D

const SPEED = 500.0
var move = Vector2.ZERO
var targetDirection: Vector2

var projectileSpawnPoint: Vector2
var projectileScene: PackedScene


func _ready():
	projectileScene = preload("res://Prefabs/Projectile.tscn")
	projectileSpawnPoint = $ProjectileSpawnPoint2.global_position


func _process(delta):
	move = key_detection()
	player_movement(move, delta)
	face_mouse_direction()


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
	print(projectileSpawnPoint)
	var newInstance = projectileScene.instance()
	get_parent().add_child(newInstance)
	newInstance.global_position = projectileSpawnPoint


func _on_body_entered(area):
	pass
