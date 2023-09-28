extends Node


var player_lifes = 3

var player_scene = preload("res://Scenes/Player.tscn")
var enemy_scene = preload("res://Scenes/Enemy.tscn")

func _ready():
	# Fixes blur player sprite on high refresh monitors
	Engine.max_fps = 60
	spawn_player()


func _process(_delta):
	check_player_exists()
	if player_lifes <= 0:
		print("GameOver")


func check_player_exists():
	if has_node("Player"):
		return
	if $PlayerSpawnTimer.is_stopped():
		$PlayerSpawnTimer.start()


func spawn_player():
	var instance = player_scene.instantiate()
	add_child(instance)


func spawn_enemy():
	var instance = enemy_scene.instantiate()
	
	var enemy_spawn_area = $PlayArea/PlayAreaCollisionShape2D as CollisionShape2D
	
	# Calculates the global position of the bottom right vertex for the spawnable area
	var enemy_spawn_x = enemy_spawn_area.get_shape().size.x
	var enemy_spawn_y = enemy_spawn_area.get_shape().size.y
	var bottom_right_vertex = Vector2(enemy_spawn_x, enemy_spawn_y)
	
	# Calculates the global position of the top left vertex for the spawnable area
	var enemy_spawn_area_pos = enemy_spawn_area.global_position
	var top_left_vertex = enemy_spawn_area_pos - (bottom_right_vertex - enemy_spawn_area_pos)
	
	# Returns a random Vector2 within the minimum and maxium especified.
	instance.global_position = Tools.random_vector2(top_left_vertex, bottom_right_vertex)
	
	# Sets enemy scale before adding to the tree
	instance.global_scale = instance.enemy_scale
	
	add_child(instance)


func _on_player_spawn_timer_timeout():
	if player_lifes > 0:
		spawn_player()


func _on_enemy_spawn_timer_timeout():
	spawn_enemy()
