extends CharacterBody2D


var speed: float = 6.0
var enemy_scale: Vector2 = Vector2(1, 1)

var player: Node
var player_position: Vector2


func _physics_process(_delta):
	find_player()
	chase_player()


func find_player():
	if player == null && $"../".has_node("Player"):
		player = get_node("../Player")


func chase_player():
	if player != null:
		player_position = player.position
		var target_position = (player_position - position).normalized()
		move_and_collide(target_position * speed)


func _on_area_2d_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	pass
#	if _body.is_in_group("player"):
#		_body.queue_free()
#		queue_free()
