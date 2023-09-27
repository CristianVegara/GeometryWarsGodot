extends CharacterBody2D

var speed: float = 10.0
var player:Node
var player_position


func _physics_process(delta):
	var direction = Vector2.ZERO
	find_player()
	chase_player()


func find_player():
	if player == null:
		player = get_node("../Player")


func chase_player():
	if player != null:
		player_position = player.position
		var target_position = (player_position - position).normalized()
		move_and_collide(target_position * speed)
		look_at(player_position)
	
